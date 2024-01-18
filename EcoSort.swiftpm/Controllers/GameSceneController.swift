//
//  GameSceneController.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

class GameSceneController: SKScene {
    var sprite = SKSpriteNode()
    
    override func sceneDidLoad() {
        sprite = SKSpriteNode(color: .red, size: CGSize(width: 200, height: 200))
        sprite.position = CGPoint(x: 0, y: 0)
        addChild(sprite)
    }
}
