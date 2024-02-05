//
//  DialogueSceneController.swift
//
//
//  Created by Pedro Franco on 24/01/24.
//

import SpriteKit


class DialogueSceneController: SKScene {
    var dialogueSceneBackground = SKSpriteNode()
    var currentDialogueBox = SKSpriteNode()
    var emmaBox = SKSpriteNode()
    var leftArrow = SKSpriteNode()
    var rightArrow = SKSpriteNode()
    var continueButton = SKSpriteNode()
    var bottle = SKSpriteNode()
    var player = SKSpriteNode()
    var trashCarried = SKSpriteNode()
    var elderlyWoman = SKSpriteNode()
    
    var updateScreen = false
        
    var constants = Constants()
    
    var gameScene = GameSceneController()
        
    var elderlyWomanTextures = [SKTexture]()
    var dialogueBoxes = [SKTexture]()
    var screenMaxX: CGFloat = 0.0
    var screenMinX: CGFloat = 0.0
    var screenMinY: CGFloat = 0.0
    var screenMaxY: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    var screenWidth: CGFloat = 0.0
    
    var moveBottle, movePlayer: SKAction!
    
    var isMovingBottle = false
    var isMovingPlayer = false
    var alreadyCreated = false
    
    var counter = 0
    var bottleMoveValue = 0.0
    var playerMoveValue = 0.0
    
    var finalPosition: CGFloat = 0.0
    
    override func didMove(to view: SKView) {
        initializeConstants()
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: screenWidth, height: screenHeight)

        // Create scene background
        createDialogueSceneBackground()
        
        // Create dialogue box
        createDialogueBox()
        
        // Create continue button
        createContinueButton()
        
        // Create emma box
        createEmmaBox()
        
        // Create elderly woman sprite
        createElderlyWoman()
        
        // Run elderly woman animation
        runElderlyWomanAction()
        
        // Create arrows
        createLeftArrow()
        createRightArrow()
        
        if updateScreen {
            currentDialogueBox.texture = SKTexture(imageNamed: "dialogue-box-lose")
            leftArrow.alpha = 0
            leftArrow.isUserInteractionEnabled = false
            rightArrow.alpha = 0
            rightArrow.isUserInteractionEnabled = false
            continueButton.texture = SKTexture(imageNamed: "play-again-button")
            continueButton.alpha = 1
        }
                
        finalPosition = -(screenWidth / 2) + player.frame.width / 2 + screenWidth * 0.19
        
        gameScene.changeUIDelegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
        trashCarried.position = CGPoint(x: player.frame.minX, y: player.position.y + 20)
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if rightArrow.contains(location) {
                if counter < 5 && !updateScreen {
                    counter += 1
                    changeDialogueBoxTexture(spriteValue: counter)
                }
            }
            
            if leftArrow.contains(location) {
                if counter > 0 && !updateScreen  {
                    counter -= 1
                    changeDialogueBoxTexture(spriteValue: counter)
                }
            }
            
            if continueButton.contains(location) && continueButton.alpha == 1 {
                let transition = SKTransition.fade(withDuration: 1)
                let scene = GameSceneController(size: self.size)
                self.view?.presentScene(scene, transition: transition)
            }
            
            if !updateScreen {
                updateArrowsVisibility()
                updatePlayButtonVisibility()
            }
        }
    }
}
