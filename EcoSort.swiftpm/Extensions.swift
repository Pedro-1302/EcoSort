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
    func createBackground() {
        background = SKSpriteNode(color: .black, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        background.alpha = 0.4
        background.zPosition = 2
        addChild(background)
    }
    
    func createRecycleSymbol() {
        recycleSymbol = SKSpriteNode(imageNamed: "recycle-symbol")
        recycleSymbol.size = CGSize(width: 100, height: 100)
        recycleSymbol.position = CGPoint(x: 200, y: 80)
        recycleSymbol.zPosition = 3
        addChild(recycleSymbol)
    }
    
    func createPlayButton() {
        playButton = SKSpriteNode(imageNamed: "play-button")
        playButton.size = CGSize(width: 250, height: 110)
        playButton.position = CGPoint(x: 0, y: -400)
        playButton.zPosition = 3
        addChild(playButton)
    }
    
    func createLogo() {
        logo = SKSpriteNode(imageNamed: "logo0")
        logo.size = CGSize(width: 796, height: 235)
        logo.position = CGPoint(x: 0, y: beachBackgroundNodesArrays[0].frame.maxY - 100)
        logo.zPosition = 3
        addChild(logo)
    }
    
    func addLogoAnimation() {
        var walkAnimation = SKAction.animate(with: lg, timePerFrame: 1)
        let infiniteWalkAnimation = SKAction.repeatForever(walkAnimation)
        logo.run(infiniteWalkAnimation)
    }
    
    func addRotateAction() {
        guard let rotateSymbolAction = rotateAction else { return }
        recycleSymbol.run(rotateSymbolAction)
    }
    
    func createBeachNodes() {
        for i in 0...2 {
            let imageName = "beach\(i)"
            let beachBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1366, height: 594), zPosition: 1, ancorPoint: CGPoint(x: 1, y: 0))
            beachBackground.position = CGPoint(x: beachBackground.size.width * CGFloat(i), y: -size.height / 2 + beachBackground.frame.size.height / 4)
            addChild(beachBackground)
            beachBackgroundArray.append(imageName)
            beachBackgroundNodesArrays.append(beachBackground)
        }
    }
    
    func createCityNodes() {
        for i in 0...2 {
            let imageName = "city\(i)"
            let cityBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1366, height: 433), zPosition: 1, ancorPoint: CGPoint(x: 1, y: 0.5))
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
                    node.position.x += (self.scene?.size.width)! * 3
                }
            }))
        }
    }
}

extension GameSceneController {
    func createPlayerNode() {
        player = SKSpriteNode(imageNamed: "player-stop01")
        player.size = CGSize(width: 80, height: 160)
        player.position = CGPoint(x: -500, y: 0)
        player.zPosition = 3
        addChild(player)
    }
    
    func createDownArrow() {
        downArrow = SKSpriteNode(imageNamed: "down-arrow")
        downArrow.size = CGSize(width: 120, height: 120)
        downArrow.position = CGPoint(x: -600, y: -440)
        downArrow.zPosition = 2
        addChild(downArrow)
    }
    
    func createUpArrow() {
        upArrow = SKSpriteNode(imageNamed: "up-arrow")
        upArrow.size = CGSize(width: 120, height: 120)
        upArrow.position = CGPoint(x: -600, y: -320)
        upArrow.zPosition = 2
        addChild(upArrow)
    }
    
    func createInfoButton() {
        infoButton = SKSpriteNode(imageNamed: "info-button")
        infoButton.size = CGSize(width: 70, height: 70)
        infoButton.position = CGPoint(x: -600, y: 440)
        infoButton.zPosition = 2
        addChild(infoButton)
    }
    
    func createScoreNode() {
        scoreNode = SKSpriteNode(imageNamed: "score-box")
        scoreNode.size = CGSize(width: 323, height: 78)
        scoreNode.position = CGPoint(x: 480, y: 440)
        scoreNode.zPosition = 2
        addChild(scoreNode)
    }
    
    func createScoreLabel() {
        scoreLabel = SKLabelNode(text: "SCORE = \(score)")
        scoreLabel.position = CGPoint(x: scoreNode.frame.midX, y: scoreNode.position.y - scoreLabel.frame.height / 2 - 6)
        scoreLabel.zPosition = 3
        scoreLabel.fontSize = 48
        addChild(scoreLabel)
    }
    
    func createInvisibleTopWall() {
        topWall = SKSpriteNode(color: .clear, size: CGSize(width: size.height + 40, height: 2))
        topWall.position = CGPoint(x: 0, y: 70)
        topWall.zPosition = 3
        addChild(topWall)
    }
    
    func createInvisibleBottomWall() {
        bottomWall = SKSpriteNode(color: .clear, size: CGSize(width: size.height + 40, height: 2))
        bottomWall.position = CGPoint(x: 0, y: -260)
        bottomWall.zPosition = 3
        addChild(bottomWall)
    }
    
    func createYellowTrash() {
        yellowTrash = SKSpriteNode(imageNamed: "recycle-yellow")
        yellowTrash.size = CGSize(width: 120, height: 150)
        yellowTrash.position = CGPoint(x: 400, y: -420)
        yellowTrash.zPosition = 2
        addChild(yellowTrash)
    }
    
    func createGreenTrash() {
        greenTrash = SKSpriteNode(imageNamed: "recycle-green")
        greenTrash.size = CGSize(width: 120, height: 150)
        greenTrash.position = CGPoint(x: 600, y: -420)
        greenTrash.zPosition = 2
        addChild(greenTrash)
    }
    
    func createBlueTrash() {
        blueTrash = SKSpriteNode(imageNamed: "recycle-blue")
        blueTrash.size = CGSize(width: 120, height: 150)
        blueTrash.position = CGPoint(x: 200, y: -420)
        blueTrash.zPosition = 2
        addChild(blueTrash)
    }
    
    func createRedTrash() {
        redTrash = SKSpriteNode(imageNamed: "recycle-red")
        redTrash.size = CGSize(width: 120, height: 150)
        redTrash.position = CGPoint(x: 0, y: -420)
        redTrash.zPosition = 2
        redTrash.alpha = 0.5
        addChild(redTrash)
    }
    
    func createCurrentTrashCarried() {
        currentTrash = SKSpriteNode(imageNamed: "recycle-red")
        currentTrash.size = CGSize(width: 60, height: 75)
        currentTrash.position = CGPoint(x: player.frame.minX, y: player.position.y)
        currentTrash.zPosition = 2
        addChild(currentTrash)
    }
    
    func addRunAction() {
        guard let runAction = runAction else { return }
        player.run(runAction)
    }
    
    func createBeachNodes() {
        for i in 0...2 {
            let imageName = "beach\(i)"
            let beachBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1366, height: 594), zPosition: 1, ancorPoint: CGPoint(x: 1, y: 0))
            beachBackground.position = CGPoint(x: beachBackground.size.width * CGFloat(i), y: -size.height / 2 + beachBackground.frame.size.height / 4)
            addChild(beachBackground)
            beachBackgroundArray.append(imageName)
            beachBackgroundNodesArrays.append(beachBackground)
        }
    }
    
    func createCityNodes() {
        for i in 0...2 {
            let imageName = "city\(i)"
            let cityBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1366, height: 433), zPosition: 1, ancorPoint: CGPoint(x: 1, y: 0.5))
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
                    node.position.x += (self.scene?.size.width)! * 3
                }
            }))
        }
    }
    
    func addMoveUpAction() {
        let moveUp = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        moveUpAction = SKAction.repeatForever(moveUp)
    }
    
    func addMoveDownAction() {
        let moveDown = SKAction.moveBy(x: 0, y: -1, duration: 0.1)
        moveDownAction = SKAction.repeatForever(moveDown)
    }
    
    func changeTrashTexture(textureName: String) {
        currentTrash.texture = SKTexture(imageNamed: textureName)
    }
    
    func changeAllTrashAlpha() {
        greenTrash.alpha = 1
        yellowTrash.alpha = 1
        blueTrash.alpha = 1
        redTrash.alpha = 1
    }
    
    func changeCurrentTrashAlphe(trashNode: SKNode) {
        trashNode.alpha = 0.5
    }
}
