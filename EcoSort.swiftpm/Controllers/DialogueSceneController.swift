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
    var upArrow = SKSpriteNode()
    var downArrow = SKSpriteNode()
    var playButton = SKSpriteNode()
    
    var screenMaxX = Constants.shared.getScreenMaxX()
    var screenMinX = Constants.shared.getScreenMinX()
    
    var dialoguesBoxes =  [
        SKTexture(imageNamed: "dialogue01"),
        SKTexture(imageNamed: "dialogue02"),
        SKTexture(imageNamed: "dialogue03"),
        SKTexture(imageNamed: "dialogue04"),
        SKTexture(imageNamed: "dialogue05"),
        SKTexture(imageNamed: "dialogue06")
    ]
    
    var can = SKSpriteNode()
    var player = SKSpriteNode()
    
    var moveCan, movePlayer: SKAction!
    
    var isMovingCan = false
    var isMovingPlayer = false

    var counter = 0
    var canMoveValue = 0.0
    var playerMoveValue = 0.0
    
    override func sceneDidLoad() {
        createDialogueSceneBackground()
        createDialogueBox()
        createUpArrow()
        createDownArrow()
        createPlayButton()
        
        moveCan = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        movePlayer = SKAction.move(to: CGPoint(x: 0, y: player.position.y), duration: 5.0)
        
        can = SKSpriteNode(imageNamed: "metal-can")
        can.size = CGSize(width: 70, height: 70)
        can.position = CGPoint(x: screenMaxX, y: 0)
        can.position = CGPoint(x: -1000, y: 0)
        can.zPosition = 3
        addChild(can)
        
        player = SKSpriteNode(imageNamed: "right-player-stop01")
        player.size = CGSize(width: 80, height: 160)
        can.position = CGPoint(x: screenMinX, y: 0)
        player.zPosition = 4
        addChild(player)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isMovingCan && can.position.x > 0 {
            canMoveValue -= 5
        }
        
        if can.position.x > 0 {
            isMovingCan = true
            can.run(moveCan, withKey: "moveCan")
        } else {
            can.removeAction(forKey: "moveCan")
        }
        
        can.position = CGPoint(x: canMoveValue + screenMaxX, y: can.position.y)

        
        if isMovingPlayer && player.position.x < 0 {
            playerMoveValue += 5
        }

        if player.position.x < 0 {
            isMovingPlayer = true
            player.run(movePlayer, withKey: "movePlayer")
        } else {
            player.removeAction(forKey: "movePlayer")
        }

        player.position = CGPoint(x: playerMoveValue - screenMaxX, y: player.position.y)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if downArrow.contains(location) {
                if counter < 5 {
                    counter += 1
                    changeDialogueBoxTexture(spriteValue: counter)
                }
            }
            
            if upArrow.contains(location) {
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
            
            updatePlayButtonVisibility()
        }
    }
}
