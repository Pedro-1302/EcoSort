//
//  DialogueSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
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
    
    var updateScreen: GameState = .playing
    
    var constants = K()
    
    var gameScene = GameSceneController()
    
    var elderlyWomanTextures = [SKTexture]()
    var finishDialogueBoxes = [SKTexture]()
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
    
    var dialoguePromptText = SKLabelNode()
    
    var dialogues = [String]()
    var finishDialogues = [String]()
    var gameOverDialogue = ""
    
    var timers: [Timer] = []
    
    var trashes = SKSpriteNode()
    
    var isIphone: Bool = false

    override func didMove(to view: SKView) {
        isIphone = K.checkUIDevice()
        
        initializeConstants()
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: screenWidth, height: screenHeight)
        
        AudioManager.shared.stopBackgroundMusic()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            AudioManager.shared.playDialogueBackgroundSounds()
        }
        
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
        
        finalPosition = -(screenWidth / 2) + player.frame.width / 2 + screenWidth * 0.19
        
        gameScene.changeUIDelegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.createDialoguePromptText()
        }
        
        if updateScreen == .finished {
            trashes = SKSpriteNode(imageNamed: "finish-trashes")
            
            if isIphone {
                trashes.size = CGSize(width: screenWidth * 0.38, height: screenHeight * 0.20)
            } else {
                trashes.size = CGSize(width: screenWidth * 0.62, height: screenHeight * 0.19)
            }
            
            trashes.position = CGPoint(x: 0, y: 0)
            addChild(trashes)
        }
        
    }
        
    override func update(_ currentTime: TimeInterval) {
        trashCarried.position = CGPoint(x: player.frame.minX, y: player.position.y + 20)
        
        if updateScreen == .playing {
            checkAndAddAnimation()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if rightArrow.contains(location) {
                if counter < 5 && updateScreen != .gameOver {
                    counter += 1
                    restartTypingSound()
                    changeDialogueBoxText(spriteValue: counter)
                }
            }
            
            if leftArrow.contains(location) {
                if counter > 0 && updateScreen != .gameOver {
                    counter -= 1
                    restartTypingSound()
                    changeDialogueBoxText(spriteValue: counter)
                }
            }
            
            if continueButton.contains(location) && continueButton.alpha == 1 {
                transitionToScene(is: updateScreen)
            }
            
            if updateScreen != .gameOver {
                updateArrowsVisibility()
                updatePlayButtonVisibility()
            }
        }
    }
    
}
