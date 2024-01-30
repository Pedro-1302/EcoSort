//
//  DialogueSceneExtension.swift
//
//
//  Created by Pedro Franco on 30/01/24.
//

import SpriteKit

extension DialogueSceneController {
    func createDialogueSceneBackground() {
        dialogueSceneBackground = SKSpriteNode(imageNamed: "dialogue-screen")
        dialogueSceneBackground.size = CGSize(width: screenWidth, height: screenHeight)
        dialogueSceneBackground.position = CGPoint(x: 0, y: 0)
        addChild(dialogueSceneBackground)
    }
    
    func createDialogueBox() {
        currentDialogueBox = SKSpriteNode(imageNamed: "dialogue-box01")
        currentDialogueBox.size = CGSize(width: screenWidth * 0.46, height: screenHeight * 0.21)
        currentDialogueBox.position = CGPoint(x: screenWidth / 2 - currentDialogueBox.frame.width / 2 - screenWidth * 0.18, y: -(screenHeight / 2) + currentDialogueBox.size.height / 2 + screenHeight * 0.13)
        currentDialogueBox.zPosition = 2
        currentDialogueBox.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(currentDialogueBox)
    }
    
    func createLeftArrow() {
        leftArrow = SKSpriteNode(imageNamed: "arrow-left")
        leftArrow.size = CGSize(width: 120, height: 120)
        leftArrow.position = CGPoint(x: -(screenWidth / 2) + (leftArrow.frame.width / 2) + (screenWidth * 0.05), y: currentDialogueBox.position.y)
        leftArrow.zPosition = 2
        leftArrow.alpha = 0.5
        addChild(leftArrow)
    }
    
    func createRightArrow() {
        rightArrow = SKSpriteNode(imageNamed: "arrow-right")
        rightArrow.size = CGSize(width: 120, height: 120)
        rightArrow.position = CGPoint(x: screenWidth / 2 - (rightArrow.frame.width / 2)  - (screenWidth * 0.05), y: currentDialogueBox.position.y)
        
        rightArrow.zPosition = 2
        addChild(rightArrow)
    }
    
    func createContinueButton() {
        continueButton = SKSpriteNode(imageNamed: "letsplay-button")
        continueButton.size = CGSize(width: screenWidth * 0.23, height: screenHeight * 0.08)
        continueButton.position = CGPoint(x: 0, y: currentDialogueBox.frame.minY - continueButton.frame.height / 2 - (screenHeight * 0.02))
        continueButton.zPosition = 2
        continueButton.alpha = 0
        addChild(continueButton)
    }
    
    func setupActions() {
        moveBottle = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        movePlayer = SKAction.move(to: CGPoint(x: 0, y: player.position.y), duration: 5.0)
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
        player = SKSpriteNode(imageNamed: "right-player-stop01")
        player.size = CGSize(width: 80, height: 160)
        bottle.position = CGPoint(x: screenMinX, y: 0)
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
        elderlyWoman.size = CGSize(width: 136, height: 130)
        elderlyWoman.zPosition = 3
        addChild(elderlyWoman)
    }
    
    func runElderlyWomanAction() {
        let elderlyWomanAnimation = SKAction.animate(with: elderlyWomanTextures, timePerFrame: 0.3)
        let infiniteElderlyWomanAnimation = SKAction.repeatForever(elderlyWomanAnimation)
        elderlyWoman.run(infiniteElderlyWomanAnimation)
    }
    
    func changeDialogueBoxTexture(spriteValue: Int) {
        currentDialogueBox.texture = dialogueBoxes[spriteValue]
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
}
