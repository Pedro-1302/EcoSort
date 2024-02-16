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
    private var dialogueMusicPlayer: AVAudioPlayer?
    private var gameOverPlayer: AVAudioPlayer?
    private var typingSoundEffectPlayer: AVAudioPlayer?

    private init() {
        setupAudioPlayers()
    }

    private func setupAudioPlayers() {
        // Configure main music
        guard let musicURL = Bundle.main.url(forResource: "main-music", withExtension: "mp3") else {
            return
        }
        
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: musicURL)
            backgroundMusicPlayer?.numberOfLoops = -1 // Loop
            backgroundMusicPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        // Configure game over sound effect
        guard let gameOverURL = Bundle.main.url(forResource: "gameover-sound", withExtension: "mp3") else {
            return
        }
        
        do {
            gameOverPlayer = try AVAudioPlayer(contentsOf: gameOverURL)
            gameOverPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        // Configure dialogue music
        guard let dialogueMusicURL = Bundle.main.url(forResource: "dialogue-music", withExtension: "mp3") else {
            return
        }
        
        do {
            dialogueMusicPlayer = try AVAudioPlayer(contentsOf: dialogueMusicURL)
            dialogueMusicPlayer?.numberOfLoops = -1
            dialogueMusicPlayer?.volume = 0.8
            dialogueMusicPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        // Configure typing sound
        guard let typingSoundURL = Bundle.main.url(forResource: "typing", withExtension: "mp3") else {
            return
        }
        
        do {
            typingSoundEffectPlayer = try AVAudioPlayer(contentsOf: typingSoundURL)
            typingSoundEffectPlayer?.numberOfLoops = 0
            typingSoundEffectPlayer?.volume = 0.7
            typingSoundEffectPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
        }

    }

    func playBackgroundMusic() {
        if let player = backgroundMusicPlayer, !player.isPlaying {
            player.play()
        }
    }
    
    func playDialogueBackgroundSounds() {
        if let player = dialogueMusicPlayer, !player.isPlaying {
            player.play()
        }
    }

    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
    }
    
    func stopDialogueSounds() {
        dialogueMusicPlayer?.stop()
    }
    
    func stopTypingSound() {
        typingSoundEffectPlayer?.stop()
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
    
    func restartTypingSound() {
        if let player = typingSoundEffectPlayer {
            if player.isPlaying {
                player.stop()
            }
            player.currentTime = 0
            player.play()
        }
    }
    
    func restartDialogueMusic() {
        if let player = dialogueMusicPlayer {
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
    
    func playTypingSoundEffect() {
        if let player = typingSoundEffectPlayer {
            if !player.isPlaying {
                player.play()
            }
        }
    }

}
