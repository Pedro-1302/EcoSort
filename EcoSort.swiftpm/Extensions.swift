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
        recycleSymbol.size = CGSize(width: 100, height: 100)
        recycleSymbol.position = CGPoint(x: 0, y: 0)
        recycleSymbol.zPosition = 3
        addChild(recycleSymbol)
    }
    
    func createPlayButton() {
        playButton = SKSpriteNode(imageNamed: "play-button")
        playButton.size = CGSize(width: 250, height: 110)
        playButton.position = CGPoint(x: 0, y: -300)
        playButton.zPosition = 3
        addChild(playButton)
    }
    
    func addRotateAction() {
        guard let rotateSymbolAction = rotateAction else { return }
        recycleSymbol.run(rotateSymbolAction)
    }
    
    func createBeachNodes() {
        for i in 0...3 {
            let imageName = "beach\(i)"
            let beachBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1336, height: 594), zPosition: 2, ancorPoint: CGPoint(x: 1, y: 0))
            beachBackground.position = CGPoint(x: beachBackground.size.width * CGFloat(i), y: -size.height / 2 + beachBackground.frame.size.height / 4)
            addChild(beachBackground)
            beachBackgroundArray.append(imageName)
            beachBackgroundNodesArrays.append(beachBackground)
        }
    }
    
    func createCityNodes() {
        for i in 0...3 {
            let imageName = "city\(i)"
            let cityBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1366, height: 433), zPosition: 2, ancorPoint: CGPoint(x: 1, y: 0.5))
            cityBackground.position = CGPoint(x: cityBackground.size.width * CGFloat(i), y: beachBackgroundNodesArrays[i].frame.maxY + cityBackground.frame.height / 2)
            addChild(cityBackground)
            cityBackgroundArray.append(imageName)
        }
    }

    public func addIndividualSprite(texture: String, size: CGSize, zPosition: Double, ancorPoint: CGPoint) -> SKSpriteNode {
        let node = SKSpriteNode()
        node.texture = SKTexture(imageNamed: texture)
        node.position = position
        node.size = size
        node.zPosition = zPosition
        node.anchorPoint = ancorPoint
        node.name = texture
        return node
    }
    
    func addEnumerateNodes(arrayNodeName: [String], speed: Int, baseNameNode: String, arraySize: Int) {
        for i in 0...arraySize {
            self.enumerateChildNodes(withName: "\(baseNameNode)\(i)", using: ({
                (node, error) in
                node.position.x -=  CGFloat(speed)
                if node.position.x < -((self.scene?.size.width)!) {
                    node.position.x += (self.scene?.size.width)! * CGFloat(arraySize)
                }
            }))
        }
    }
}
