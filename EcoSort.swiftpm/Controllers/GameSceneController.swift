//
//  GameSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

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
    
    var greenTrashArray = [
        SKTexture(imageNamed: "rec-green01"),
        SKTexture(imageNamed: "rec-green02"),
        SKTexture(imageNamed: "rec-green03"),
        SKTexture(imageNamed: "rec-green02"),
        SKTexture(imageNamed: "rec-green01")]
    
    var yellowTrashArray = [
        SKTexture(imageNamed: "rec-yellow01"),
        SKTexture(imageNamed: "rec-yellow02"),
        SKTexture(imageNamed: "rec-yellow03"),
        SKTexture(imageNamed: "rec-yellow02"),
        SKTexture(imageNamed: "rec-yellow01")]
    
    var blueTrashArray = [
        SKTexture(imageNamed: "rec-blue01"),
        SKTexture(imageNamed: "rec-blue02"),
        SKTexture(imageNamed: "rec-blue03"),
        SKTexture(imageNamed: "rec-blue02"),
        SKTexture(imageNamed: "rec-blue01")]
    
    var redTrashArray = [
        SKTexture(imageNamed: "rec-red01"),
        SKTexture(imageNamed: "rec-red02"),
        SKTexture(imageNamed: "rec-red03"),
        SKTexture(imageNamed: "rec-red02"),
        SKTexture(imageNamed: "rec-red01")]
    
    var score = Constants.shared.getGameScore()
    var mapScrollSpeed = Constants.shared.getBaseGameSpeed()
    var playerMoveSpeed = Constants.shared.getPlayerMoveSpeed()
    var screenMaxX = Constants.shared.getScreenMaxX()
    
    var isMovingUp = false
    var isMovingDown = false
    var isMovingScreenLimit = false
    var isItemCollected = false
    
    var value = 0.0
    var newspaperMoveValue = 0.0
    var wineMoveValue = 0.0
    var botleMoveValue = 0.0
    var mp3MoveValue = 0.0
    var currentTrashText = ""
    var texturaAtual = ""
    
    var usedYPositions = Set<CGFloat>()
    
    override func sceneDidLoad() {
        Constants.shared.setupCustomFont()
        
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
        
        currentTrashText = "rec-red01"
    }
    
    override func update(_ currentTime: TimeInterval) {
        texturaAtual = currentTrashText
                
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
                
        if player.frame.intersects(newspaper.frame) && currentTrashText == "rec-blue01" {
            resetNewspaper()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(wine.frame) && currentTrashText == "rec-green01" {
            resetWine()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(bottle.frame) && currentTrashText == "rec-red01" {
            resetBottle()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(mp3.frame) && currentTrashText == "rec-yellow01" {
            resetMP3()
            addTrashAnimation()
            updateUI()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if infoButton.frame.contains(location) {
                print("teste som teste")
            }
            
            if greenTrash.frame.contains(location) {
                self.currentTrash.removeAction(forKey: "animateTexture")
                changeTrashTexture(textureName: "rec-green01")
                currentTrashText = "rec-green01"
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: greenTrash)
            }
            
            if yellowTrash.frame.contains(location) {
                self.currentTrash.removeAction(forKey: "animateTexture")
                changeTrashTexture(textureName: "rec-yellow01")
                currentTrashText = "rec-yellow01"
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: yellowTrash)
            }
            
            if blueTrash.frame.contains(location) {
                self.currentTrash.removeAction(forKey: "animateTexture")
                changeTrashTexture(textureName: "rec-blue01")
                currentTrashText = "rec-blue01"
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: blueTrash)
            }
            
            if redTrash.frame.contains(location) {
                self.currentTrash.removeAction(forKey: "animateTexture")
                changeTrashTexture(textureName: "rec-red01")
                currentTrashText = "rec-red01"
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: redTrash)
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
