//
//  DialogueSceneExtension.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import SpriteKit

// MARK: - Nodes Creation
extension DialogueSceneController {
    func createDialogueSceneBackground() {
        if updateScreen == .finished {
            dialogueSceneBackground = SKSpriteNode(imageNamed: "dialogue-screen-finish")
        } else {
            dialogueSceneBackground = SKSpriteNode(imageNamed: "dialogue-screen")
        }
        dialogueSceneBackground.size = CGSize(width: screenWidth, height: screenHeight)
        dialogueSceneBackground.position = CGPoint(x: 0, y: 0)
        addChild(dialogueSceneBackground)
    }
    
    func createDialogueBox() {
        currentDialogueBox = SKSpriteNode(imageNamed: "default-dialogue-box")

        if isIphone {
            currentDialogueBox.size = CGSize(width: screenWidth * 0.30, height: screenHeight * 0.22)
            currentDialogueBox.position = CGPoint(x: screenWidth / 2 - currentDialogueBox.frame.width / 2 - screenWidth * 0.30, y: -(screenHeight / 2) + currentDialogueBox.size.height / 2 + screenHeight * 0.16)
        } else {
            currentDialogueBox.size = CGSize(width: screenWidth * 0.46, height: screenHeight * 0.21)
            currentDialogueBox.position = CGPoint(x: screenWidth / 2 - currentDialogueBox.frame.width / 2 - screenWidth * 0.18, y: -(screenHeight / 2) + currentDialogueBox.size.height / 2 + screenHeight * 0.13)
        }
        
        currentDialogueBox.zPosition = 2
        currentDialogueBox.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(currentDialogueBox)
    }
    
    func createLeftArrow() {
        leftArrow = SKSpriteNode(imageNamed: "arrow-left")

        if isIphone {
            leftArrow.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.12)
            leftArrow.position = CGPoint(x: -(screenWidth / 2) + (leftArrow.frame.width / 2) + screenWidth * 0.21, y: currentDialogueBox.position.y)
        } else {
            leftArrow.size = CGSize(width: screenWidth * 0.09, height: screenHeight * 0.12)
            leftArrow.position = CGPoint(x: -(screenWidth / 2) + (leftArrow.frame.width / 2) + (screenWidth * 0.05), y: currentDialogueBox.position.y)
        }
        
        leftArrow.zPosition = 2
        
        if updateScreen == .gameOver {
            leftArrow.alpha = 0
            leftArrow.isUserInteractionEnabled = false
        } else {
            leftArrow.alpha = 0.5
        }
        
        addChild(leftArrow)
    }
    
    func createRightArrow() {
        rightArrow = SKSpriteNode(imageNamed: "arrow-right")

        if isIphone { 
            rightArrow.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.12)
            rightArrow.position = CGPoint(x: screenWidth / 2 - (rightArrow.frame.width / 2)  - (screenWidth * 0.21), y: currentDialogueBox.position.y)
        } else {
            rightArrow.size = CGSize(width: screenWidth * 0.09, height: screenHeight * 0.12)
            rightArrow.position = CGPoint(x: screenWidth / 2 - (rightArrow.frame.width / 2)  - (screenWidth * 0.05), y: currentDialogueBox.position.y)
        }
        
        rightArrow.zPosition = 2
        
        if updateScreen == .gameOver {
            rightArrow.alpha = 0
            rightArrow.isUserInteractionEnabled = false
        }
        
        addChild(rightArrow)
    }
    
    func createContinueButton() {
        if updateScreen == .gameOver {
            continueButton.texture = SKTexture(imageNamed: "play-again-button")
            continueButton.alpha = 1
        } else if updateScreen == .finished {
            continueButton = SKSpriteNode(imageNamed: "finish-game-button")
            continueButton.alpha = 0
        } else {
            continueButton = SKSpriteNode(imageNamed: "letsplay-button")
            continueButton.alpha = 0
        }

        if isIphone {
            continueButton.size = CGSize(width: screenWidth * 0.20, height: screenHeight * 0.12)
            continueButton.position = CGPoint(x: 0, y: currentDialogueBox.frame.minY - continueButton.frame.height / 2 - (screenHeight * 0.02))
        } else {
            continueButton.size = CGSize(width: screenWidth * 0.23, height: screenHeight * 0.08)
            continueButton.position = CGPoint(x: 0, y: currentDialogueBox.frame.minY - continueButton.frame.height / 2 - (screenHeight * 0.02))
        }
        
        continueButton.zPosition = 2
        
        addChild(continueButton)
    }
    
    func createBottle() {
        bottle = SKSpriteNode(imageNamed: "water-bottle")
        
        if isIphone {
            bottle.size = CGSize(width: screenWidth * 0.056, height: screenHeight * 0.06)
        } else {
            bottle.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.04)
        }
        
        bottle.position = CGPoint(x: screenMaxX, y: 0)
        bottle.zPosition = 3
        addChild(bottle)
    }
    
    func createPlayer() {
        player = SKSpriteNode(imageNamed: "player01")
        
        if isIphone {
            player.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.18)
        } else {
            player.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.16)
        }
        
        player.position = CGPoint(x: screenMinX, y: 0)
        player.zPosition = 4
        addChild(player)
    }
    
    func createTrashCarried() {
        trashCarried = SKSpriteNode(imageNamed: "rec-red01")
        
        if isIphone {
            trashCarried.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.15)
        } else {
            trashCarried.size = CGSize(width: screenWidth * 0.09, height: screenHeight * 0.12)
        }
        
        trashCarried.position = CGPoint(x: -1000, y: player.position.y + 20)
        trashCarried.zPosition = 3
        addChild(trashCarried)
    }
    
    func createEmmaBox() {
        emmaBox = SKSpriteNode(imageNamed: "emma-box")

        if isIphone {
            emmaBox.size = CGSize(width: screenWidth * 0.10, height: screenHeight * 0.22)
            emmaBox.position = CGPoint(x: currentDialogueBox.frame.minX - emmaBox.frame.width / 2, y: currentDialogueBox.position.y)
        } else {
            emmaBox.size = CGSize(width: screenWidth * 0.17, height: screenHeight * 0.21)
            emmaBox.position = CGPoint(x: currentDialogueBox.frame.minX - emmaBox.frame.width / 2, y: currentDialogueBox.position.y)
        }
        
        emmaBox.zPosition = 2
        emmaBox.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(emmaBox)
    }
    
    func createElderlyWoman() {
        elderlyWoman = SKSpriteNode(imageNamed: "elderly-woman01")
     
        if isIphone {
            elderlyWoman.size = CGSize(width: screenWidth * 0.07, height: screenHeight * 0.15)
            elderlyWoman.position = CGPoint(x: emmaBox.frame.midX, y: emmaBox.frame.midY)
        } else {
            elderlyWoman.size = CGSize(width: screenWidth * 0.10, height: screenHeight * 0.14)
            elderlyWoman.position = CGPoint(x: emmaBox.frame.midX, y: emmaBox.frame.midY)
        }
        
        elderlyWoman.zPosition = 3
        addChild(elderlyWoman)
    }
    
    func createDialoguePromptText() {
        dialoguePromptText = SKLabelNode()
        
        if updateScreen == .gameOver {
            AudioManager.shared.playTypingSoundEffect()
            restartAnimation(withText: gameOverDialogue)
        } else if updateScreen == .finished {
            AudioManager.shared.playTypingSoundEffect()
            restartAnimation(withText: finishDialogues[0])
        } else {
            AudioManager.shared.playTypingSoundEffect()
            restartAnimation(withText: dialogues[0])
        }
        
        dialoguePromptText.position = CGPoint(x: currentDialogueBox.frame.midX, y: currentDialogueBox.frame.midY)
        dialoguePromptText.horizontalAlignmentMode = .center
        dialoguePromptText.verticalAlignmentMode = .center
        dialoguePromptText.numberOfLines = 0
        
        if isIphone {
            dialoguePromptText.preferredMaxLayoutWidth = currentDialogueBox.frame.width - (screenWidth * 0.048)
        } else {
            dialoguePromptText.preferredMaxLayoutWidth = currentDialogueBox.frame.width - (screenWidth * 0.08)
        }
        
        dialoguePromptText.zPosition = 10
        
        addChild(dialoguePromptText)
    }
}

// MARK: - Action
extension DialogueSceneController {
    func setupActions() {
        moveBottle = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        movePlayer = SKAction.move(to: CGPoint(x: 0, y: player.position.y), duration: 5.0)
    }
    
    func runElderlyWomanAction() {
        let elderlyWomanAnimation = SKAction.animate(with: elderlyWomanTextures, timePerFrame: 0.3)
        let infiniteElderlyWomanAnimation = SKAction.repeatForever(elderlyWomanAnimation)
        elderlyWoman.run(infiniteElderlyWomanAnimation)
    }
}

// MARK: - Aux Methods
extension DialogueSceneController {
    func changeDialogueBoxText(spriteValue: Int) {
        if updateScreen == .playing {
            playTipingSound()
            restartAnimation(withText: dialogues[counter])
        } else if updateScreen == .finished {
            playTipingSound()
            restartAnimation(withText: finishDialogues[spriteValue])
        }
    }
    
    func restartAnimation(withText text: String) {
        resetTimers()
        
        dialoguePromptText.attributedText = NSAttributedString(string: "")
        
        var charIndex = 0.0
        var currentText = ""
        
        for letter in text {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.027 * charIndex, repeats: false) { timer in
                currentText.append(letter)
                let attributedText = self.generateAttributedString(text: currentText)
                self.dialoguePromptText.attributedText = attributedText
            }
            timers.append(timer)
            charIndex += 1
        }
    }
    
    func resetTimers() {
        for timer in timers {
            timer.invalidate()
        }
        timers.removeAll()
    }
    
    func generateAttributedString(text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()

        var fontSize = 0.0
        
        if isIphone {
            fontSize = 8
            paragraphStyle.lineSpacing = 5
        } else {
            fontSize = 16
            paragraphStyle.lineSpacing = 8
        }

        let descriptionAttributedString = NSMutableAttributedString(string: text, attributes: [
            .font: UIFont(name: "PressStart2P-Regular", size: fontSize)!,
            .foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        
        let wordColors: [String: UIColor] = [
            "metal": UIColor.yellow,
            "plastic": UIColor.red,
            "paper": UIColor.blue,
            "glass": UIColor.green
        ]
        
        for (word, color) in wordColors {
            let range = (text as NSString).range(of: word, options: .caseInsensitive)
            if range.location != NSNotFound {
                descriptionAttributedString.addAttribute(.foregroundColor, value: color, range: range)
            }
        }
        
        return descriptionAttributedString
    }
    
    func updatePlayButtonVisibility() {
        if counter == 5 {
            continueButton.alpha = 1
        } else {
            continueButton.alpha = 0
        }
    }
    
    func updateArrowsVisibility() {
        if counter == 0 {
            leftArrow.alpha = 0.5
        } else {
            leftArrow.alpha = 1
        }
        
        if counter == 5 {
            rightArrow.alpha = 0.5
        } else {
            rightArrow.alpha = 1
        }
    }
    
    func initializeConstants() {
        elderlyWomanTextures = constants.getElderlyWomanTextures()
        screenMaxX = constants.getScreenMaxX()
        screenMinX = constants.getScreenMinX()
        screenMaxY = constants.getScreenMaxY()
        screenMinY = constants.getScreenMinY()
        screenHeight = constants.getScreenHeight()
        screenWidth = constants.getScreenWidth()
        dialogues = constants.getDialogues()
        finishDialogues = constants.getFinishDialogues()
        gameOverDialogue = constants.getGameOverDialogue()
    }
    
    func updatePlayerPosition() {
        player.position = CGPoint(x: playerMoveValue - screenMaxX, y: player.position.y)
    }
    
    func updateBottlePosition() {
        bottle.position = CGPoint(x: bottleMoveValue + screenMaxX, y: bottle.position.y)
    }
    
    func denitializeNodes() {
        bottle.removeAction(forKey: "moveCan")
        bottle.removeFromParent()
        player.removeAction(forKey: "movePlayer")
        player.removeFromParent()
        trashCarried.removeFromParent()
        alreadyCreated = false
        playerMoveValue = 0
        bottleMoveValue = 0
    }
    
    func initializeNodes() {
        if !alreadyCreated {
            createTrashCarried()
            setupActions()
            createBottle()
            createPlayer()
            alreadyCreated = true
        }
    }
    
    func restartTypingSound() {
        AudioManager.shared.restartTypingSound()
    }
    
    func stopTypingSound() {
        AudioManager.shared.stopTypingSound()
    }
    
    func playTipingSound() {
        AudioManager.shared.playTypingSoundEffect()
    }
    
    func transitionToScene(is state: GameState) {
        let transition = SKTransition.fade(withDuration: 1)
        
        var nextScene: SKScene
        
        switch state {
            case .finished:
                nextScene = HomeSceneController(size: self.size)
            case .gameOver, .playing:
                nextScene = GameSceneController(size: self.size)
        }
        
        AudioManager.shared.stopDialogueSounds()
        
        self.view?.presentScene(nextScene, transition: transition)
    }
    
    func checkAndAddAnimation() {
        if counter == 3 {
            initializeNodes()
            
            if isMovingPlayer && player.position.x < finalPosition {
                playerMoveValue += 8
            }
            
            if player.position.x < finalPosition {
                isMovingPlayer = true
                player.run(movePlayer, withKey: "movePlayer")
            } else {
                player.removeAction(forKey: "movePlayer")
                if isMovingBottle && bottle.position.x > finalPosition {
                    bottleMoveValue -= 6
                }
                
                if bottle.position.x > finalPosition {
                    isMovingBottle = true
                    bottle.run(moveBottle, withKey: "moveCan")
                } else {
                    bottle.removeAction(forKey: "moveCan")
                    
                    bottle.removeFromParent()
                }
                
                updateBottlePosition()
            }
            
            updatePlayerPosition()
        } else {
            denitializeNodes()
        }
    }
}

// MARK: - ChangeUIProtocol
extension DialogueSceneController: ChangeUIProtocol {
    func updateUI(state: GameState) {
        self.updateScreen = state
    }
}
