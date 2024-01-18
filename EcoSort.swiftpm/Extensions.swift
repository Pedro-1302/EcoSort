//
//  Extensions.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

// MARK: Extension with setup for all sprites in HomeSceneController
extension HomeSceneController {
    func createRecycleSymbol() {
        recycleSymbol = SKSpriteNode(imageNamed: "recycle-symbol")
        recycleSymbol.position = CGPoint(x: 0, y: 0)
        addChild(recycleSymbol)
    }
    
    func createRotateAction() {
        guard let rotateSymbolAction = rotateAction else { return }
        
        recycleSymbol.run(rotateSymbolAction)
    }
    
    func createPlayButton() {
        playButton = SKSpriteNode(imageNamed: "play-button")
        playButton.position = CGPoint(x: 0, y: 0)
        addChild(playButton)
    }
}
