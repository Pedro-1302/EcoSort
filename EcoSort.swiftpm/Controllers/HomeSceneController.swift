//
//  HomeSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
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
    
    var mapScrollSpeed = Constants.shared.getSpeed()
    
    var lg = [SKTexture(imageNamed: "logo0"), SKTexture(imageNamed: "logo1"), SKTexture(imageNamed: "logo2"), SKTexture(imageNamed: "logo3")]

    override func sceneDidLoad() {
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
                let scene = SKScene(fileNamed: "GameScene")
                self.view!.presentScene(scene!, transition: transition)
            }
        }
    }
}
