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
    private var gameOverPlayer: AVAudioPlayer?

    private init() {
        setupAudioPlayers()
    }

    private func setupAudioPlayers() {
        // Configurar a faixa de música de fundo
        guard let musicURL = Bundle.main.url(forResource: "main-music", withExtension: "mp3") else {
            return
        }

        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: musicURL)
            backgroundMusicPlayer?.numberOfLoops = -1 // Reproduz em loop indefinidamente
            backgroundMusicPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
        }

        // Configurar faixa de música de game over
        guard let gameOverURL = Bundle.main.url(forResource: "gameover-sound", withExtension: "mp3") else {
            return
        }

        do {
            gameOverPlayer = try AVAudioPlayer(contentsOf: gameOverURL)
            gameOverPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
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

    func playGameOverSound() {
        if let player = gameOverPlayer {
            if !player.isPlaying {
                player.play()
            }
        }
    }
}
