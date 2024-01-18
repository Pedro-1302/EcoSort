//
//  HomeSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

class HomeSceneController: SKScene {
    
    var recycleSymbol = SKSpriteNode()
    var playButton = SKSpriteNode()
    
    var rotateAction = SKAction(named: "Rotate")
    
    var beachBackgroundArray = [String]()
    var cityBackgroundArray = [String]()
    var beachBackgroundNodesArrays = [SKSpriteNode]() 
    
    var mapScrollSpeed = Constants.shared.getSpeed()
    
    override func sceneDidLoad() {
        createRecycleSymbol()
        addRotateAction()
        createPlayButton()
        createBeachNodes()
        createCityNodes()
    }
    
    override func update(_ currentTime: TimeInterval) {
        addEnumerateNodes(arrayNodeName: beachBackgroundArray, speed: mapScrollSpeed, baseNameNode: "beach", arraySize: beachBackgroundArray.count - 1)
        addEnumerateNodes(arrayNodeName: cityBackgroundArray, speed: mapScrollSpeed, baseNameNode: "city", arraySize: cityBackgroundArray.count - 1)
    }
    
}
