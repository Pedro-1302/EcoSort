//
//  GameSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import SpriteKit
import GameplayKit

enum GarbageType {
    case paper
    case metal
    case glass
    case plastic
}

enum GameState {
    case playing
    case gameOver
    case finished
}

protocol ChangeUIProtocol {
    func updateUI(state: GameState)
}

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
    var paperItem = SKSpriteNode()
    var glassItem = SKSpriteNode()
    var plasticItem = SKSpriteNode()
    var metalItem = SKSpriteNode()
    var bananaPeel = SKSpriteNode()
    var apple = SKSpriteNode()
    var heart0 = SKSpriteNode()
    var heart1 = SKSpriteNode()
    var heart2 = SKSpriteNode()
    
    // Delegate
    var changeUIDelegate: ChangeUIProtocol?
    
    // Actions
    var runAction = SKAction(named: "Run")
    var moveUpAction, moveDownAction, movePaper, moveGlasses, movePlastic, moveMetal: SKAction!
    
    // Arrays
    var beachBackgroundArray = [String]()
    var cityBackgroundArray = [String]()
    var beachBackgroundNodesArray = [SKSpriteNode]()
    var garbageItems = [SKNode]()
    var hearts = [SKSpriteNode]()
    
    // Constants
    var constants = K()
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
    var heartTextures = [SKTexture]()
    var paperTextures = [SKTexture]()
    var glassTextures = [SKTexture]()
    var plasticTextures = [SKTexture]()
    var metalTextures = [SKTexture]()
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
    
    var heartsGone = 0
    
    // Game Score
    var score = GameScore.shared.getGameScore()
    
    // Itens positions
    var usedYPositions = Set<CGFloat>()
    
    let randomSource = GKRandomSource.sharedRandom()
    
    var items = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        // Setup music and sound effects
        AudioManager.shared.stopTypingSound()
        AudioManager.shared.stopDialogueSounds()
        AudioManager.shared.playBackgroundMusic()
        
        // Initialize Constants
        setupScreenBounds()
        initializeSpeed()
        intiializeTrashes()
        initializeItemsSizes()
        initializeItemsTextures()
        heartTextures = constants.getHeartTextures()
        
        // Setup view/scene configuration
        view.isMultipleTouchEnabled = true
        view.isExclusiveTouch = true
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: screenWidth, height: screenHeight)
        
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
        createPaperItem()
        createGlassItem()
        createPlasticItem()
        createMetalItem()
        createBananaPeel()
        createApple()
        
        // Create and add hearts
        createHearts()
        
        // Add hearts to array
        addHeartsToArray()
        
        currentTrashText = "rec-red01"
        
        items = [paperItem, metalItem, plasticItem, glassItem]
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
        
        if isMovingScreenLimit && paperItem.position.x > frame.minX {
            paperMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && glassItem.position.x > frame.minX {
            glassMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && plasticItem.position.x > frame.minX {
            plasticMoveValue -= mapScrollSpeed
        }
        
        if isMovingScreenLimit && metalItem.position.x > frame.minX {
            metalMoveValue -= mapScrollSpeed
        }
        
        if player.frame.intersects(paperItem.frame) && currentTrashText == "rec-blue01" {
            resetPaper()
            playItemCollectedSoundEffect()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(glassItem.frame) && currentTrashText == "rec-green01" {
            resetGlass()
            playItemCollectedSoundEffect()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(plasticItem.frame) && currentTrashText == "rec-red01" {
            resetPlastic()
            playItemCollectedSoundEffect()
            addTrashAnimation()
            updateUI()
        }
        
        if player.frame.intersects(metalItem.frame) && currentTrashText == "rec-yellow01" {
            resetMetal()
            playItemCollectedSoundEffect()
            addTrashAnimation()
            updateUI()
        }
        
        setUpdateConditionsForNodes(node: paperItem)
        setUpdateConditionsForNodes(node: glassItem)
        setUpdateConditionsForNodes(node: plasticItem)
        setUpdateConditionsForNodes(node: metalItem)
        
        updateNodesPosition(node: paperItem)
        updateNodesPosition(node: glassItem)
        updateNodesPosition(node: plasticItem)
        updateNodesPosition(node: metalItem)
        
        addEnumerateNodes(arrayNodeName: beachBackgroundArray, speed: mapScrollSpeed, baseNameNode: "beach", arraySize: beachBackgroundArray.count - 1)
        addEnumerateNodes(arrayNodeName: cityBackgroundArray, speed: mapScrollSpeed, baseNameNode: "city", arraySize: cityBackgroundArray.count - 1)
        
        if score == 25 {
            let dialogueSceneController = DialogueSceneController(size: self.size)
            changeScene(to: dialogueSceneController, with: .finished)
        }
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
    
    func playItemCollectedSoundEffect() {
        AudioManager.shared.playItemCollectedSoundEffect()
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
        for _ in touches {
            removeMoveUpAction()
            removeMoveDownAction()
        }
    }
}
