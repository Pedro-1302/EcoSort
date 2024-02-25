//
//  AudioManager.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import AVFoundation

class AudioManager {
    static let shared = AudioManager()

    private var backgroundMusicPlayer: AVAudioPlayer?
    private var dialogueMusicPlayer: AVAudioPlayer?
    private var gameOverPlayer: AVAudioPlayer?
    private var typingSoundEffectPlayer: AVAudioPlayer?
    private var itemCollectedSoundEffectPlayer: AVAudioPlayer?


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
            dialogueMusicPlayer?.volume = 1
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
            typingSoundEffectPlayer?.volume = 0.8
            typingSoundEffectPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
        }

        guard let itemCollectedURL = Bundle.main.url(forResource: "trash-collected", withExtension: "mp3") else {
            return
        }
        
        do {
            itemCollectedSoundEffectPlayer = try AVAudioPlayer(contentsOf: itemCollectedURL)
            itemCollectedSoundEffectPlayer?.numberOfLoops = 0
            itemCollectedSoundEffectPlayer?.volume = 1
            itemCollectedSoundEffectPlayer?.prepareToPlay()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    func playBackgroundMusic() {
        if let player = backgroundMusicPlayer {
            if player.isPlaying {
                player.stop()
            }
            player.currentTime = 0
            player.play()
        }
    }
    
    func playDialogueBackgroundSounds() {
        if let player = dialogueMusicPlayer, !player.isPlaying {
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
    
    func playItemCollectedSoundEffect() {
        if let player = itemCollectedSoundEffectPlayer {
            if player.isPlaying {
                player.stop()
            }
            player.currentTime = 0
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

}
