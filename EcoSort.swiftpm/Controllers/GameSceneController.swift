//
//  GameSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import SpriteKit

class GameSceneController: SKScene {
    var player = SKSpriteNode()
    var scoreNode = SKSpriteNode()
    var scoreLabel = SKLabelNode()
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
    var metalCan = SKSpriteNode()
    
    var runAction = SKAction(named: "Run")
    
    var moveUpAction, moveDownAction, moveNewspaper, moveWine, moveBottle, moveMetalCan: SKAction!
    
    var beachBackgroundArray = [String]()
    var cityBackgroundArray = [String]()
    var beachBackgroundNodesArray = [SKSpriteNode]()
    var garbageItems = [SKNode]()
    
    var score = Constants.shared.getGameScore()
    var mapScrollSpeed = Constants.shared.getBaseGameSpeed()
    var playerMoveSpeed = Constants.shared.getPlayerMoveSpeed()
    var screenMaxX = Constants.shared.getScreenMaxX()
    var screenMinX = Constants.shared.getScreenMinX()
    var screenMinY = Constants.shared.getScreenMinY()
    var screenMaxY = Constants.shared.getScreenMaxY()
    var screenHeight = Constants.shared.getScreenHeight()
    var screenWidth = Constants.shared.getScreenWidth()
    var blueTrashTextures = Constants.shared.getBlueTrashArray()
    var redTrashTextures = Constants.shared.getRedTrashArray()
    var yellowTrashTextures = Constants.shared.getYellowTrashArray()
    var greenTrashTextures = Constants.shared.getGreenTrashArray()
    
    var isMovingUp = false
    var isMovingDown = false
    var isMovingScreenLimit = false
    var isItemCollected = false
    
    var value = 0.0
    var newspaperMoveValue = 0.0
    var wineMoveValue = 0.0
    var botleMoveValue = 0.0
    var metalCanMoveValue = 0.0
    var currentTrashText = ""
    var currentTexture = ""
    
    var usedYPositions = Set<CGFloat>()
        
    override func didMove(to view: SKView) {
        view.isMultipleTouchEnabled = true
        view.isExclusiveTouch = true
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: screenWidth, height: screenHeight)
        
        Constants.shared.setupCustomFont()
        
        createDownArrow()
        createUpArrow()
        createPlayerNode()
        addRunAction()
        createBeachNodes()
        createCityNodes()
        addMoveUpAction()
        addMoveDownAction()
        createInvisibleTopWall()
        createInvisibleBottomWall()
        createGreenTrash()
        createYellowTrash()
        createBlueTrash()
        createRedTrash()
        createScoreNode()
        createScoreLabel()
        createCurrentTrashCarried()
        setupItensMove()
        createNewspaper()
        createVine()
        createBottle()
        createMetalCan()
        
        currentTrashText = "rec-red01"
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
        
        if isMovingScreenLimit && metalCan.position.x > frame.minX {
            metalCanMoveValue -= mapScrollSpeed
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
        
        if player.frame.intersects(metalCan.frame) && currentTrashText == "rec-yellow01" {
            resetMetalCan()
            addTrashAnimation()
            updateUI()
        }
        
        setUpdateConditionsForNodes(node: newspaper)
        setUpdateConditionsForNodes(node: wine)
        setUpdateConditionsForNodes(node: bottle)
        setUpdateConditionsForNodes(node: metalCan)
        
        updateNodesPosition(node: newspaper)
        updateNodesPosition(node: wine)
        updateNodesPosition(node: bottle)
        updateNodesPosition(node: metalCan)
        
        addEnumerateNodes(arrayNodeName: beachBackgroundArray, speed: mapScrollSpeed, baseNameNode: "beach", arraySize: beachBackgroundArray.count - 1)
        
        addEnumerateNodes(arrayNodeName: cityBackgroundArray, speed: mapScrollSpeed, baseNameNode: "city", arraySize: cityBackgroundArray.count - 1)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("began \(touches.count)")
        
        for touch in touches {
            let location = touch.location(in: self)
            print(touch.tapCount)
            
            if upArrow.frame.contains(location) && player.frame.minY < topWall.position.y {
                isMovingUp = true
                player.run(moveUpAction, withKey: "moveUp")
            }
            
            if downArrow.frame.contains(location) && player.frame.minY > bottomWall.position.y {
                isMovingDown = true
                player.run(moveDownAction, withKey: "moveDown")
            }
            
            if greenTrash.frame.contains(location) {
                changeTrashTexture(textureName: "rec-green01")
                removeAnimationTexture()
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: greenTrash)
            }
            
            if yellowTrash.frame.contains(location) {
                changeTrashTexture(textureName: "rec-yellow01")
                removeAnimationTexture()
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: yellowTrash)
            }
            
            if blueTrash.frame.contains(location) {
                changeTrashTexture(textureName: "rec-blue01")
                removeAnimationTexture()
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: blueTrash)
            }
            
            if redTrash.frame.contains(location) {
                changeTrashTexture(textureName: "rec-red01")
                removeAnimationTexture()
                changeAllTrashAlpha()
                changeCurrentTrashAlpha(trashNode: redTrash)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if !upArrow.frame.contains(location) && !downArrow.frame.contains(location) {
                removeMoveUpAction()
                removeMoveDownAction()
            }
            
            if upArrow.frame.contains(location) && player.frame.minY < topWall.position.y {
                isMovingUp = true
                player.run(moveUpAction, withKey: "moveUp")
                removeMoveDownAction()
            }
            
            if downArrow.frame.contains(location) && player.frame.minY > bottomWall.position.y {
                isMovingDown = true
                player.run(moveDownAction, withKey: "moveDown")
                removeMoveUpAction()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            removeMoveUpAction()
            removeMoveDownAction()
        }
    }

    
}
