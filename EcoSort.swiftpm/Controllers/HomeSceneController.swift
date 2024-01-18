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
    var rotateAction = SKAction(named: "Rotate")
    var playButton = SKSpriteNode()
    
    override func sceneDidLoad() {
        createRecycleSymbol()
        createRotateAction()
        createPlayButton()
    }
}
