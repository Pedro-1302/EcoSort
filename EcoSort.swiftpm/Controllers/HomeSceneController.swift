//
//  HomeSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import SpriteKit

class HomeSceneController: SKScene {
    var background = SKSpriteNode()
    var recycleSymbol = SKSpriteNode()
    var playButton = SKSpriteNode()
    var logo = SKSpriteNode()
    
    var rotateAction = SKAction(named: "Rotate")
    var logoAnimationAction = SKAction(named: "LogoAnimation")
    
    var beachBackgroundArray = [String]()
    var cityBackgroundArray = [String]()
    var beachBackgroundNodesArrays = [SKSpriteNode]()
    
    var constants = Constants()
    
    var mapScrollSpeed = 0
    var screenMaxX: CGFloat = 0.0
    var screenMinX: CGFloat = 0.0
    var screenMinY: CGFloat = 0.0
    var screenMaxY: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    var screenWidth: CGFloat = 0.0
    var logoTextures = [SKTexture]()
    
    override func didMove(to view: SKView) {
        initializeConstants()

        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.size = CGSize(width: screenWidth, height: screenHeight)

        createBackground()
        createRecycleSymbol()
        addRotateAction()
        createPlayButton()
        createBeachNodes()
        createCityNodes()
        createLogo()
        addLogoAnimation()
    }
    
    override func update(_ currentTime: TimeInterval) {
        addEnumerateNodes(arrayNodeName: beachBackgroundArray, speed: mapScrollSpeed, baseNameNode: "beach", arraySize: beachBackgroundArray.count - 1)
        
        addEnumerateNodes(arrayNodeName: cityBackgroundArray, speed: mapScrollSpeed, baseNameNode: "city", arraySize: cityBackgroundArray.count - 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if playButton.frame.contains(location) {
                let transition = SKTransition.fade(withDuration: 1)
                 let scene = DialogueSceneController(size: self.size)
                 self.view?.presentScene(scene, transition: transition)
            }
        }
    }
}
