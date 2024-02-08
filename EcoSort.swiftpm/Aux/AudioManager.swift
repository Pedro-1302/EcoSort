//
//  AudioManager.swift
//
//
//  Created by Pedro Franco on 08/02/24.
//

import AVFoundation

class AudioManager {
    static let shared = AudioManager()

    private var backgroundMusicPlayer: AVAudioPlayer?

    private init() {
        setupAudioPlayer()
    }

    private func setupAudioPlayer() {
        guard let musicURL = Bundle.main.url(forResource: "main-music", withExtension: "mp3") else {
            return
        }

        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: musicURL)
            backgroundMusicPlayer?.numberOfLoops = -1 // Reproduz em loop indefinidamente
            backgroundMusicPlayer?.prepareToPlay()
        } catch {
            print("Erro ao carregar o arquivo de música: \(error.localizedDescription)")
        }
    }

    func playBackgroundMusic() {
        if let player = backgroundMusicPlayer, !player.isPlaying {
            player.play()
        }
    }

    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
    }

    func restartBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if player.isPlaying {
                player.stop()
            }
            player.currentTime = 0
            player.play()
        }
    }
}

