//
//  GameSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import SpriteKit

class GameSceneController: SKScene {
    // Game Nodes
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
    var paperPlane = SKSpriteNode()
    var glassBottle = SKSpriteNode()
    var bananaPeel = SKSpriteNode()
    var apple = SKSpriteNode()
    var plasticBag = SKSpriteNode()
    var canOpened = SKSpriteNode()
    
    // Actions
    var runAction = SKAction(named: "Run")
    var moveUpAction, moveDownAction, movePaper, moveGlasses, movePlastic, moveMetal: SKAction!
    
    // Arrays
    var beachBackgroundArray = [String]()
    var cityBackgroundArray = [String]()
    var beachBackgroundNodesArray = [SKSpriteNode]()
    var garbageItems = [SKNode]()
    var paperTextures = [SKTexture]()
    var glassTextures = [SKTexture]()
    var plasticTextures = [SKTexture]()
    var metalTextures = [SKTexture]()
    
    // Constants
    var constants = Constants()
    var mapScrollSpeed: CGFloat = 0.0
    var playerMoveSpeed: CGFloat = 0.0
    var screenMaxX: CGFloat = 0.0
    var screenMinX: CGFloat = 0.0  
    var screenMinY: CGFloat = 0.0  
    var screenMaxY: CGFloat = 0.0  
    var screenHeight: CGFloat = 0.0
    var screenWidth: CGFloat = 0.0
    var blueTrashTextures = [SKTexture]()
    var redTrashTextures = [SKTexture]()
    var yellowTrashTextures = [SKTexture]()
    var greenTrashTextures = [SKTexture]()
    var item16xWidth: CGFloat = 0.0
    var item16xHeight: CGFloat = 0.0
    var item32xWidth: CGFloat = 0.0
    var item32xHeight: CGFloat = 0.0
    
    // Game Controllers
    var isMovingUp = false
    var isMovingDown = false
    var isMovingScreenLimit = false
    var isItemCollected = false
    
    // Game Aux
    var value = 0.0
    var paperMoveValue = 0.0
    var glassMoveValue = 0.0
    var plasticMoveValue = 0.0
    var metalMoveValue = 0.0
    var currentTrashText = ""
    var currentTexture = ""
    
    // Game Score
    var score = GameScore.shared.getGameScore()
    
    // Itens positions
    var usedYPositions = Set<CGFloat>()
    
    override func didMove(to view: SKView) {
        initilizeConstants()
        initializeItemsSizes()
        
        view.isMultipleTouchEnabled = true
        view.isExclusiveTouch = true
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: screenWidth, height: screenHeight)
        
        paperTextures = [
            SKTexture(imageNamed: "paper-plane"),
            SKTexture(imageNamed: "newspaper")
        ]
        
        glassTextures = [
            SKTexture(imageNamed: "wine"),
            SKTexture(imageNamed: "glass-bottle")
        ]
        
        plasticTextures = [
            SKTexture(imageNamed: "plastic-bag"),
            SKTexture(imageNamed: "water-bottle")
        ]
        
        metalTextures = [
            SKTexture(imageNamed: "metal-can"),
            SKTexture(imageNamed: "can-opened")
        ]
        
        constants.setupCustomFont() 
        
        // Create arrows to control the player movement
        createDownArrow()
        createUpArrow()
        
        // Create player
        createPlayerNode()
        
        // Add player run action
        addRunAction()
        
        // Setup background
        createBeachNodes()
        createCityNodes()
        
        // Add actions to player move
        addMoveUpAction()
        addMoveDownAction()
        
        // Create invisible walls to player dont go away from the borders
        createInvisibleTopWall()
        createInvisibleBottomWall()
        
        // Create trashes
        createGreenTrash()
        createYellowTrash()
        createBlueTrash()
        createRedTrash()
        
        // Create Score node and Label
        createScoreNode()
        createScoreLabel()
        
        // Create Current trash carried by the player
        createCurrentTrashCarried()
        
        // Setup actions for items
        setupItensMove()
        
        // Create and Add items
        createNewspaper()
        createWine()
        createBottle()
        createMetalCan()
        createPaperPlane()
        createGlassBottle()
        createBananaPeel()
        createApple()
        createOpenedCan()
        createPlasticBag()
    
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
            paperMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && wine.position.x > frame.minX {
            glassMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && bottle.position.x > frame.minX {
            plasticMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && metalCan.position.x > frame.minX {
            metalMoveValue -= mapScrollSpeed
        }
        
        if player.frame.intersects(newspaper.frame) && currentTrashText == "rec-blue01" {
            resetPaper()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(wine.frame) && currentTrashText == "rec-green01" {
            resetGlass()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(bottle.frame) && currentTrashText == "rec-red01" {
            resetPlastic()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(metalCan.frame) && currentTrashText == "rec-yellow01" {
                        
            resetMetal()
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
        for touch in touches {
            let location = touch.location(in: self)
            
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
