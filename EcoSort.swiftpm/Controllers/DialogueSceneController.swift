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
    var playButton = SKSpriteNode()
    var bottle = SKSpriteNode()
    var player = SKSpriteNode()
    var trashCarried = SKSpriteNode()
    var elderlyWoman = SKSpriteNode()
    
    var screenMaxX = Constants.shared.getScreenMaxX()
    var screenMinX = Constants.shared.getScreenMinX()
    var elderlyWomanTextures = Constants.shared.getElderlyWomanTextures()
    var dialogueBoxes = Constants.shared.getDialogueBoxes()
    
    var moveBottle, movePlayer: SKAction!
    
    var isMovingBottle = false
    var isMovingPlayer = false
    var alreadyCreated = false
    
    var counter = 0
    var bottleMoveValue = 0.0
    var playerMoveValue = 0.0

    override func sceneDidLoad() {
        createDialogueSceneBackground()
        createDialogueBox()
        createPlayButton()
        createEmmaBox()
        createElderlyWoman()
        runElderlyWomanAction()
        createLeftArrow()
        createRightArrow()
    }
    
    override func update(_ currentTime: TimeInterval) {
        trashCarried.position = CGPoint(x: player.frame.minX, y: player.position.y + 20)
        
        if counter == 3 {
            initializeNodes()

            if isMovingPlayer && player.position.x < -500 {
                playerMoveValue += 5
            }
            
            if player.position.x < -500 {
                isMovingPlayer = true
                player.run(movePlayer, withKey: "movePlayer")
            } else {
                player.removeAction(forKey: "movePlayer")
                if isMovingBottle && bottle.position.x > -500 {
                    bottleMoveValue -= 5
                }
                
                if bottle.position.x > -500 {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if rightArrow.contains(location) {
                if counter < 5 {
                    counter += 1
                    changeDialogueBoxTexture(spriteValue: counter)
                }
            }
            
            if leftArrow.contains(location) {
                if counter > 0 {
                    counter -= 1
                    changeDialogueBoxTexture(spriteValue: counter)
                }
            }
            
            if playButton.contains(location) && playButton.alpha == 1 {
                let transition = SKTransition.fade(withDuration: 1)
                let scene = SKScene(fileNamed: "GameScene")
                self.view!.presentScene(scene!, transition: transition)
            }
            
            updateArrowsVisibility()
            updatePlayButtonVisibility()
        }
    }
}