//
//  GameSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

enum TrashType {
    case green
    case yellow
    case red
    case blue
}

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
    var currentTrash = SKSpriteNode()
    var newspaper = SKSpriteNode()
    var wine = SKSpriteNode()
    var bottle = SKSpriteNode()
    var mp3 = SKSpriteNode()
    
    var runAction = SKAction(named: "Run")
    
    var moveUpAction, moveDownAction, moveNewspaper, moveWine, moveBottle, moveMP3: SKAction!
    
    var beachBackgroundArray = [String]()
    var cityBackgroundArray = [String]()
    var beachBackgroundNodesArrays = [SKSpriteNode]()
    var garbageItems = [SKNode]()
    
    var greenTrashArray = [SKTexture(imageNamed: "rec-green01"), SKTexture(imageNamed: "rec-green02"), SKTexture(imageNamed: "rec-green03"), SKTexture(imageNamed: "rec-green02"), SKTexture(imageNamed: "rec-green01")]
    
    var yellowTrashArray = [SKTexture(imageNamed: "rec-yellow01"), SKTexture(imageNamed: "rec-yellow02"), SKTexture(imageNamed: "rec-yellow03"), SKTexture(imageNamed: "rec-yellow02"), SKTexture(imageNamed: "rec-yellow01")]
    
    var blueTrashArray = [SKTexture(imageNamed: "rec-blue01"), SKTexture(imageNamed: "rec-blue02"), SKTexture(imageNamed: "rec-blue03"), SKTexture(imageNamed: "rec-blue02"), SKTexture(imageNamed: "rec-blue01")]
    
    var redTrashArray = [SKTexture(imageNamed: "rec-red01"), SKTexture(imageNamed: "rec-red02"), SKTexture(imageNamed: "rec-red03"), SKTexture(imageNamed: "rec-red02"), SKTexture(imageNamed: "rec-red01")]
    
    var score = Constants.shared.getGameScore()
    var mapScrollSpeed = Constants.shared.getBaseGameSpeed()
    var playerMoveSpeed = Constants.shared.getPlayerMoveSpeed()
    var screenMaxX = Constants.shared.getScreenMaxX()
    
    var isMovingUp = false
    var isMovingDown = false
    var isMovingScreenLimit = false
    var isItemCollected = false
    var greenOn = false
    var redOn = false
    var yellowOn = false
    var blueOn = false
    
    var value = 0.0
    var newspaperMoveValue = 0.0
    var wineMoveValue = 0.0
    var botleMoveValue = 0.0
    var mp3MoveValue = 0.0
    var currentTrashText = ""
    
    var usedYPositions = Set<CGFloat>()
    
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
        createYellowTrash()
        createGreenTrash()
        createBlueTrash()
        createRedTrash()
        createCurrentTrashCarried()
        setupItensMove()
        createNewspaper()
        createVine()
        createBottle()
        createMP3()
        
        currentTrashText = "red"
    }
    
    func addTrashAnimation(trashType: TrashType) {
        switch (trashType) {
        case .blue:
            let walkAnimation = SKAction.animate(with: blueTrashArray, timePerFrame: 0.18)
            currentTrash.run(walkAnimation)
        case .red:
            let walkAnimation = SKAction.animate(with: redTrashArray, timePerFrame: 0.18)
            currentTrash.run(walkAnimation)
        case .yellow:
            let walkAnimation = SKAction.animate(with: yellowTrashArray, timePerFrame: 0.18)
            currentTrash.run(walkAnimation)
        case .green:
            let walkAnimation = SKAction.animate(with: greenTrashArray, timePerFrame: 0.18)
            currentTrash.run(walkAnimation)
        default:
            print("Error")
        }
    }
    
    func addGreenTrashAnimation() {
        let walkAnimation = SKAction.animate(with: greenTrashArray, timePerFrame: 0.18)
        
        currentTrash.run(walkAnimation)
    }
    
    func addBlueTrashAnimation() {
        let walkAnimation = SKAction.animate(with: blueTrashArray, timePerFrame: 0.18)
        
        currentTrash.run(walkAnimation)
    }
    
    func addYellowTrashAnimation() {
        let walkAnimation = SKAction.animate(with: yellowTrashArray, timePerFrame: 0.18)
        
        currentTrash.run(walkAnimation)
    }
    
    func generateRandomYPositionForNodes() -> CGFloat {
        var sortedYPosition: CGFloat
        
        repeat {
            sortedYPosition = CGFloat.random(in: bottomWall.position.y...topWall.position.y)
        } while usedYPositions.contains(sortedYPosition)
        
        usedYPositions.insert(sortedYPosition)
        return sortedYPosition
    }
    
    override func update(_ currentTime: TimeInterval) {
        updateCurrentTrashPosition()
        updatePlayerPosition()
        
        if isMovingUp && player.frame.minY < topWall.position.y {
            value += playerMoveSpeed
        }
        
        if isMovingDown && player.frame.minY > bottomWall.position.y {
            value -= playerMoveSpeed
        }
        
        if isMovingScreenLimit && newspaper.position.x > frame.minX {
            newspaperMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && wine.position.x > frame.minX {
            wineMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && bottle.position.x > frame.minX {
            botleMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && mp3.position.x > frame.minX {
            mp3MoveValue -= mapScrollSpeed
        }
        
        if player.frame.intersects(newspaper.frame) && currentTrashText == "blue" && !blueOn {
            incrementScore()
//            addTrashAnimation(trashType: .blue)
            updateUI()
            resetNewspaper()
            blueOn = true
        }
        
        if player.frame.intersects(wine.frame) && currentTrashText == "green" && !greenOn {
            incrementScore()
//            addTrashAnimation(trashType: .green)
            updateUI()
            resetWine()
            greenOn = true
        }
        
        if player.frame.intersects(bottle.frame) && currentTrashText == "red" && !redOn {
            incrementScore()
//            addTrashAnimation(trashType: .red)
            updateUI()
            resetBottle()
            redOn = true
        }
        
        if player.frame.intersects(mp3.frame) && currentTrashText == "yellow" && !yellowOn {
            incrementScore()
//            addTrashAnimation(trashType: .yellow)
            updateUI()
            resetMP3()
            yellowOn = true
        }
        
        setUpdateConditionsForNodes(node: newspaper)
        setUpdateConditionsForNodes(node: wine)
        setUpdateConditionsForNodes(node: bottle)
        setUpdateConditionsForNodes(node: mp3)
        
        updateNodesPosition(node: newspaper)
        updateNodesPosition(node: wine)
        updateNodesPosition(node: bottle)
        updateNodesPosition(node: mp3)
        
        addEnumerateNodes(arrayNodeName: beachBackgroundArray, speed: mapScrollSpeed, baseNameNode: "beach", arraySize: beachBackgroundArray.count - 1)
        
        addEnumerateNodes(arrayNodeName: cityBackgroundArray, speed: mapScrollSpeed, baseNameNode: "city", arraySize: cityBackgroundArray.count - 1)
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
    }
    
    func incrementScore() {
        score += 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if infoButton.frame.contains(location) {
                print("teste som teste")
            }
            
            if greenTrash.frame.contains(location) {
                changeAllTrashAlpha()
                changeTrashTexture(textureName: "rec-green01")
                changeCurrentTrashAlpha(trashNode: greenTrash)
                currentTrashText = "green"
            }
            
            if yellowTrash.frame.contains(location) {
                changeAllTrashAlpha()
                changeTrashTexture(textureName: "rec-yellow01")
                changeCurrentTrashAlpha(trashNode: yellowTrash)
                currentTrashText = "yellow"
            }
            
            if blueTrash.frame.contains(location) {
                changeAllTrashAlpha()
                changeTrashTexture(textureName: "rec-blue01")
                changeCurrentTrashAlpha(trashNode: blueTrash)
                currentTrashText = "blue"
            }
            
            if redTrash.frame.contains(location) {
                changeAllTrashAlpha()
                changeTrashTexture(textureName: "rec-red01")
                changeCurrentTrashAlpha(trashNode: redTrash)
                currentTrashText = "red"
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
            removeMoveUpAction()
            
            removeMoveDownAction()
        }
    }
}
