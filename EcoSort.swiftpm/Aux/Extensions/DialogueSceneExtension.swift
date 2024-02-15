//
//  DialogueSceneExtension.swift
//
//
//  Created by Pedro Franco on 30/01/24.
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
        currentDialogueBox.size = CGSize(width: screenWidth * 0.46, height: screenHeight * 0.21)
        currentDialogueBox.position = CGPoint(x: screenWidth / 2 - currentDialogueBox.frame.width / 2 - screenWidth * 0.18, y: -(screenHeight / 2) + currentDialogueBox.size.height / 2 + screenHeight * 0.13)
        currentDialogueBox.zPosition = 2
        currentDialogueBox.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(currentDialogueBox)
    }
    
    func createLeftArrow() {
        leftArrow = SKSpriteNode(imageNamed: "arrow-left")
        leftArrow.size = CGSize(width: screenWidth * 0.09, height: screenHeight * 0.12)
        leftArrow.position = CGPoint(x: -(screenWidth / 2) + (leftArrow.frame.width / 2) + (screenWidth * 0.05), y: currentDialogueBox.position.y)
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
        rightArrow.size = CGSize(width: screenWidth * 0.09, height: screenHeight * 0.12)
        rightArrow.position = CGPoint(x: screenWidth / 2 - (rightArrow.frame.width / 2)  - (screenWidth * 0.05), y: currentDialogueBox.position.y)
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
        
        continueButton.size = CGSize(width: screenWidth * 0.23, height: screenHeight * 0.08)
        continueButton.position = CGPoint(x: 0, y: currentDialogueBox.frame.minY - continueButton.frame.height / 2 - (screenHeight * 0.02))
        continueButton.zPosition = 2
        
        addChild(continueButton)
    }
    
    func createBottle() {
        bottle = SKSpriteNode(imageNamed: "water-bottle")
        bottle.size = CGSize(width: 80, height: 36)
        bottle.position = CGPoint(x: screenMaxX, y: 0)
        bottle.position = CGPoint(x: screenMinX, y: 0)
        bottle.zPosition = 3
        addChild(bottle)
    }
    
    func createPlayer() {
        player = SKSpriteNode(imageNamed: "player01")
        player.size = CGSize(width: 80, height: 160)
        player.position = CGPoint(x: screenMinX, y: 0)
        player.zPosition = 4
        addChild(player)
    }
    
    func createTrashCarried() {
        trashCarried = SKSpriteNode(imageNamed: "rec-red01")
        trashCarried.size = CGSize(width: 120, height: 120)
        trashCarried.position = CGPoint(x: -1000, y: player.position.y + 20)
        trashCarried.zPosition = 3
        addChild(trashCarried)
    }
    
    func createEmmaBox() {
        emmaBox = SKSpriteNode(imageNamed: "emma-box")
        emmaBox.size = CGSize(width: screenWidth * 0.17, height: screenHeight * 0.21)
        emmaBox.position = CGPoint(x: currentDialogueBox.frame.minX - emmaBox.frame.width / 2, y: currentDialogueBox.position.y)
        emmaBox.zPosition = 2
        emmaBox.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(emmaBox)
    }
    
    func createElderlyWoman() {
        elderlyWoman = SKSpriteNode(imageNamed: "elderly-woman01")
        elderlyWoman.position = CGPoint(x: emmaBox.frame.midX, y: emmaBox.frame.midY)
        elderlyWoman.size = CGSize(width: screenWidth * 0.10, height: screenHeight * 0.14)
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
        dialoguePromptText.preferredMaxLayoutWidth = currentDialogueBox.frame.width - (screenWidth * 0.08)
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
            AudioManager.shared.playTypingSoundEffect()
            restartAnimation(withText: dialogues[counter])
        } else if updateScreen == .finished {
            AudioManager.shared.playTypingSoundEffect()
            restartAnimation(withText: finishDialogues[spriteValue])
        }
    }
    
    func restartAnimation(withText text: String) {
        for timer in timers {
            timer.invalidate()
        }
        
        timers.removeAll()
        
        dialoguePromptText.attributedText = NSAttributedString(string: "")
        var charIndex = 0.0
        var currentText = ""
        
        for letter in text {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.03 * charIndex, repeats: false) { timer in
                currentText.append(letter)
                let attributedText = self.generateAttributedString(text: currentText)
                self.dialoguePromptText.attributedText = attributedText
            }
            timers.append(timer)
            charIndex += 1
        }
    }
    
    func generateAttributedString(text: String) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let descriptionAttributedString = NSMutableAttributedString(string: text, attributes: [
            .font: UIFont(name: "PressStart2P-Regular", size: 20)!,
            .foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        
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
}

// MARK: - ChangeUIProtocol
extension DialogueSceneController: ChangeUIProtocol {
    func updateUI(state: GameState) {
        self.updateScreen = state
    }
}
