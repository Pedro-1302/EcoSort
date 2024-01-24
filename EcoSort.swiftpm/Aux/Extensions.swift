//
//  Extensions.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

// MARK: HomeSceneController extension for setup nodes
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
        let walkAnimation = SKAction.animate(with: lg, timePerFrame: 1)
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

// MARK: GameSceneController with Node Creations
extension GameSceneController {
    func createPlayerNode() {
        player = SKSpriteNode(imageNamed: "player-stop01")
        player.size = CGSize(width: 80, height: 160)
        player.position = CGPoint(x: -500, y: 0)
        player.zPosition = 4
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
    
    func createScoreNode() {
        scoreNode = SKSpriteNode(imageNamed: "score-box")
        scoreNode.size = CGSize(width: 323, height: 78)
        scoreNode.position = CGPoint(x: 480, y: 440)
        scoreNode.zPosition = 2
        scoreNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(scoreNode)
    }
    
    func createScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "PressStart2P-Regular")
        scoreLabel.position = CGPoint(x: scoreNode.frame.midX, y: scoreNode.frame.midY - 16)
        scoreLabel.zPosition = 3
        scoreLabel.fontSize = 30
        scoreLabel.text = "Score = \(score)"
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
        yellowTrash = SKSpriteNode(imageNamed: "recycle-yellow-wlabel")
        yellowTrash.size = CGSize(width: 120, height: 170)
        yellowTrash.position = CGPoint(x: 400, y: -420)
        yellowTrash.zPosition = 2
        addChild(yellowTrash)
    }
    
    func createGreenTrash() {
        greenTrash = SKSpriteNode(imageNamed: "recycle-green-wlabel")
        greenTrash.size = CGSize(width: 120, height: 170)
        greenTrash.position = CGPoint(x: 600, y: -420)
        greenTrash.zPosition = 2
        addChild(greenTrash)
    }
    
    func createBlueTrash() {
        blueTrash = SKSpriteNode(imageNamed: "recycle-blue-wlabel")
        blueTrash.size = CGSize(width: 120, height: 170)
        blueTrash.position = CGPoint(x: 200, y: -420)
        blueTrash.zPosition = 2
        addChild(blueTrash)
    }
    
    func createRedTrash() {
        redTrash = SKSpriteNode(imageNamed: "recycle-red-wlabel")
        redTrash.size = CGSize(width: 120, height: 170)
        redTrash.position = CGPoint(x: 0, y: -420)
        redTrash.zPosition = 2
        redTrash.alpha = 0.5
        addChild(redTrash)
    }
    
    func createCurrentTrashCarried() {
        currentTrash = SKSpriteNode(imageNamed: "rec-red01")
        currentTrash.size = CGSize(width: 120, height: 120)
        currentTrash.position = CGPoint(x: player.frame.minX, y: player.position.y)
        currentTrash.zPosition = 3
        addChild(currentTrash)
    }
    
    func createNewspaper() {
        newspaper = SKSpriteNode(imageNamed: "newspaper")
        newspaper.size = CGSize(width: 100, height: 50)
        newspaper.zPosition = 2
        newspaper.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(newspaper)
    }
    
    func createVine() {
        wine = SKSpriteNode(imageNamed: "vine")
        wine.size = CGSize(width: 100, height: 50)
        wine.zPosition = 2
        wine.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(wine)
    }
    
    func createBottle() {
        bottle = SKSpriteNode(imageNamed: "water-bottle")
        bottle.size = CGSize(width: 80, height: 36)
        bottle.zPosition = 2
        bottle.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(bottle)
    }
    
    func createMetalCan() {
        metalCan = SKSpriteNode(imageNamed: "metal-can")
        metalCan.size = CGSize(width: 70, height: 70)
        metalCan.zPosition = 2
        metalCan.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(metalCan)
    }
    
    func addRunAction() {
        guard let runAction = runAction else { return }
        player.run(runAction)
    }
    
    func addMoveUpAction() {
        let moveUp = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        moveUpAction = SKAction.repeatForever(moveUp)
    }
    
    func addMoveDownAction() {
        let moveDown = SKAction.moveBy(x: 0, y: -1, duration: 0.1)
        moveDownAction = SKAction.repeatForever(moveDown)
    }
    
    func createBeachNodes() {
        for i in 0...2 {
            let imageName = "beach\(i)"
            let beachBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1366, height: 594), zPosition: 1, anchorPoint: CGPoint(x: 1, y: 0))
            beachBackground.position = CGPoint(x: beachBackground.size.width * CGFloat(i), y: -size.height / 2 + beachBackground.frame.size.height / 4)
            addChild(beachBackground)
            beachBackgroundArray.append(imageName)
            beachBackgroundNodesArrays.append(beachBackground)
        }
    }
    
    func createCityNodes() {
        for i in 0...2 {
            let imageName = "city\(i)"
            let cityBackground = addIndividualSprite(texture: imageName, size: CGSize(width: 1366, height: 433), zPosition: 1, anchorPoint: CGPoint(x: 1, y: 0.5))
            cityBackground.position = CGPoint(x: cityBackground.size.width * CGFloat(i), y: beachBackgroundNodesArrays[i].frame.maxY + cityBackground.frame.height / 2)
            addChild(cityBackground)
            cityBackgroundArray.append(imageName)
        }
    }
}

// MARK: GameSceneController with Other functions
extension GameSceneController {
    public func addIndividualSprite(texture: String, size: CGSize, zPosition: Double, anchorPoint: CGPoint) -> SKSpriteNode {
        let node = SKSpriteNode()
        node.texture = SKTexture(imageNamed: texture)
        node.position = position
        node.size = size
        node.zPosition = zPosition
        node.anchorPoint = anchorPoint
        node.name = texture
        return node
    }
 
    func addEnumerateNodes(arrayNodeName: [String], speed: Double, baseNameNode: String, arraySize: Int) {
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
    
    func changeTrashTexture(textureName: String) {
        currentTrash.texture = SKTexture(imageNamed: textureName)
    }
    
    func changeAllTrashAlpha() {
        greenTrash.alpha = 1
        yellowTrash.alpha = 1
        blueTrash.alpha = 1
        redTrash.alpha = 1
    }
    
    func changeCurrentTrashAlpha(trashNode: SKNode) {
        trashNode.alpha = 0.5
    }
    
    func updateCurrentTrashPosition() {
        currentTrash.position = CGPoint(x: player.frame.minX, y: player.position.y + 20)
    }
    
    func updatePlayerPosition() {
        player.position = CGPoint(x: player.position.x, y: value)
    }
    
    func setupItensMove() {
        moveNewspaper = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        moveWine = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        moveBottle = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        moveMetalCan = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
    }
    
    func setUpdateConditionsForNodes(node: SKNode) {
        switch (node) {
        case newspaper:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(moveNewspaper, withKey: "moveNewspaper")
            } else {
                node.removeAction(forKey: "moveNewspaper")
                resetNewspaper()
            }
        case wine:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(moveWine, withKey: "moveWine")
            } else {
                node.removeAction(forKey: "moveWine")
                resetWine()
            }
        case bottle:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(moveBottle, withKey: "moveBottle")
            } else {
                node.removeAction(forKey: "moveBottle")
                resetBottle()
            }
        case metalCan:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(moveMetalCan, withKey: "moveCan")
            } else {
                node.removeAction(forKey: "moveCan")
                resetMetalCan()
            }
        default:
            print("Error")
        }
    }
    
    func resetNewspaper() {
        isMovingScreenLimit = false
        newspaperMoveValue = 0
        newspaper.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        isMovingScreenLimit = true
    }
    
    func resetWine() {
        isMovingScreenLimit = false
        wineMoveValue = 0
        wine.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        isMovingScreenLimit = true
    }
    
    func resetBottle() {
        isMovingScreenLimit = false
        botleMoveValue = 0
        bottle.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        isMovingScreenLimit = true
    }
    
    func resetMetalCan() {
        isMovingScreenLimit = false
        metalCanMoveValue = 0
        metalCan.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        isMovingScreenLimit = true
    }
    
    func updateNodesPosition(node: SKNode) {
        switch (node) {
            case newspaper:
                newspaper.position = CGPoint(x: newspaperMoveValue + 1800 + screenMaxX, y: newspaper.position.y)
            case wine:
                wine.position = CGPoint(x: wineMoveValue + 1200 + screenMaxX, y: wine.position.y)
            case bottle:
                bottle.position = CGPoint(x: botleMoveValue + 600 + screenMaxX, y: bottle.position.y)
            case metalCan:
                metalCan.position = CGPoint(x: metalCanMoveValue + screenMaxX, y: metalCan.position.y)
            default:
                print("Error")
        }
    }
    
    func removeMoveUpAction() {
        isMovingUp = false
        player.removeAction(forKey: "moveUp")
    }
    
    func removeMoveDownAction() {
        isMovingDown = false
        player.removeAction(forKey: "moveDown")
    }
    
    func addTrashAnimation() {
        switch (currentTrashText) {
        case "rec-blue01":
            let trashAnimationAct = SKAction.animate(with: blueTrashArray, timePerFrame: 0.13)
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
        case "rec-red01":
            let trashAnimationAct = SKAction.animate(with: redTrashArray, timePerFrame: 0.13)
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
        case "rec-yellow01":
            let trashAnimationAct = SKAction.animate(with: yellowTrashArray, timePerFrame: 0.13)
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
        case "rec-green01":
            let trashAnimationAct = SKAction.animate(with: greenTrashArray, timePerFrame: 0.13)
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
        default:
            print("Error")
        }
    }

    func generateRandomYPositionForNodes() -> CGFloat {
        var sortedYPosition: CGFloat
        
        repeat {
            sortedYPosition = CGFloat.random(in: bottomWall.position.y...topWall.position.y)
        } while usedYPositions.contains(sortedYPosition)
        
        usedYPositions.insert(sortedYPosition)
        return sortedYPosition
    }
    
    func updateUI() {
        score += 1
        scoreLabel.text = "Score: \(score)"
        changeTrashTexture(textureName: texturaAtual)
    }
}

extension DialogueSceneController {
    func createDialogueSceneBackground() {
        dialogueSceneBackground = SKSpriteNode(imageNamed: "dialogue-screen")
        dialogueSceneBackground.position = CGPoint(x: 0, y: 0)
        dialogueSceneBackground.size = CGSize(width: 1366, height: 1024)
        addChild(dialogueSceneBackground)
    }
    
    func createDialogueBox() {
        currentDialogueBox.texture = dialoguesBoxes[0]
        currentDialogueBox.position = CGPoint(x: 80, y: -260)
        currentDialogueBox.size = CGSize(width: 864, height: 216)
        currentDialogueBox.zPosition = 2
        currentDialogueBox.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(currentDialogueBox)
    }
    
    func createUpArrow() {
        upArrow = SKSpriteNode(imageNamed: "up-arrow")
        upArrow.size = CGSize(width: 120, height: 120)
        upArrow.position = CGPoint(x: currentDialogueBox.frame.minX - 100, y: -200)
        upArrow.zPosition = 2
        addChild(upArrow)
    }
    
    func createDownArrow() {
        downArrow = SKSpriteNode(imageNamed: "down-arrow")
        downArrow.size = CGSize(width: 120, height: 120)
        downArrow.position = CGPoint(x: currentDialogueBox.frame.minX - 100, y: -320)
        downArrow.zPosition = 2
        addChild(downArrow)
    }
}
