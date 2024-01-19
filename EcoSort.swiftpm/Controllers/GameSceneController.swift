//
//  GameSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

var screenBounds = UIScreen.main.bounds

class GameSceneController: SKScene {
    var player = SKSpriteNode()
    var scoreNode = SKSpriteNode()
    var scoreLabel = SKLabelNode()
    var infoButton = SKSpriteNode()
    var upArrow = SKSpriteNode()
    var downArrow = SKSpriteNode()
    var topWall = SKSpriteNode()
    var bottomWall = SKSpriteNode()
    var greenTrash = SKSpriteNode()
    var yellowTrash = SKSpriteNode()
    var blueTrash = SKSpriteNode()
    var redTrash = SKSpriteNode()
    
    var runAction = SKAction(named: "Run")
    var moveUpAction, moveDownAction: SKAction!
    
    var beachBackgroundArray = [String]()
    var cityBackgroundArray = [String]()
    var beachBackgroundNodesArrays = [SKSpriteNode]()
    
    var score = Constants.shared.getGameScore()
    var mapScrollSpeed = Constants.shared.getBaseGameSpeed()

    var isMovingUp = false
    var isMovingDown = false
    
    var value = 0.0
    
    
    override func sceneDidLoad() {
        createScoreNode()
        createScoreLabel()
        createInfoButton()
        createUpArrow()
        createDownArrow()
        createPlayerNode()
        addRunAction()
        createBeachNodes()
        createCityNodes()
        addMoveUpAction()
        addMoveDownAction()
        createInvisibleTopWall()
        createInvisibleBottomWall()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isMovingUp && player.frame.minY < topWall.position.y {
            value += 5.0
        }
                
        if isMovingDown  && player.frame.minY > bottomWall.position.y {
            value -= 5.0
        }
        
        player.position = CGPoint(x: player.position.x, y: value)
        
        addEnumerateNodes(arrayNodeName: beachBackgroundArray, speed: mapScrollSpeed, baseNameNode: "beach", arraySize: beachBackgroundArray.count - 1)
        
        addEnumerateNodes(arrayNodeName: cityBackgroundArray, speed: mapScrollSpeed, baseNameNode: "city", arraySize: cityBackgroundArray.count - 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if infoButton.frame.contains(location) {
                print("teste som teste")
            }
            if upArrow.frame.contains(location) && player.frame.minY < topWall.position.y {
                isMovingUp = true
                player.run(moveUpAction, withKey: "moveUp")
            }
            
            if downArrow.frame.contains(location) && player.frame.minY > bottomWall.position.y {
                isMovingDown = true
                player.run(moveDownAction, withKey: "moveDown")
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            
            isMovingUp = false
            player.removeAction(forKey: "moveUp")
            
            isMovingDown = false
            player.removeAction(forKey: "moveDown")
        }
    }
}
