//
//  GameSceneExtension.swift
//  
//
//  Created by Pedro Franco on 30/01/24.
//

import SpriteKit

// MARK: GameSceneController with Node Creations
extension GameSceneController {
    func createPlayerNode() {
        player = SKSpriteNode(imageNamed: "player-stop01")
        player.size = CGSize(width: screenWidth * 0.059, height: screenHeight * 0.16)
        player.position = CGPoint(x: -(screenWidth / 2) + player.frame.width / 2 + screenWidth * 0.19, y: 0)
        player.zPosition = 4
        addChild(player)
    }
    
    func createDownArrow() {
        downArrow = SKSpriteNode(imageNamed: "arrow-down")
        downArrow.size = CGSize(width: screenWidth * 0.088, height: screenHeight * 0.12)
        downArrow.position = CGPoint(x: -(screenWidth / 2) + (downArrow.frame.width / 2) + screenWidth * 0.06, y: -(screenHeight / 2) + (downArrow.frame.height / 2) + screenHeight * 0.029)
        downArrow.zPosition = 2
        addChild(downArrow)
    }
    
    func createUpArrow() {
        upArrow = SKSpriteNode(imageNamed: "arrow-up")
        upArrow.size = CGSize(width: screenWidth * 0.088, height: screenHeight * 0.12)
        upArrow.position = CGPoint(x: -(screenWidth / 2) + (upArrow.frame.width / 2) + screenWidth * 0.06, y: downArrow.frame.maxY + upArrow.frame.height / 2 + screenHeight * 0.008)
        upArrow.zPosition = 2
        addChild(upArrow)
    }
    
    func createScoreNode() {
        scoreNode = SKSpriteNode(imageNamed: "score-box")
        scoreNode.size = CGSize(width: screenWidth * 0.24, height: screenHeight * 0.08)
        scoreNode.position = CGPoint(x: screenWidth / 2 - (scoreNode.frame.width / 2) - screenWidth * 0.023, y: screenHeight / 2 - (scoreNode.frame.height / 2) - screenHeight * 0.032)
        scoreNode.zPosition = 2
        scoreNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(scoreNode)
    }
    
    func createScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "PressStart2P-Regular")
        scoreLabel.position = CGPoint(x: scoreNode.frame.midX, y: scoreNode.frame.midY - 16)
        scoreLabel.zPosition = 3
        scoreLabel.fontSize = 26
        scoreLabel.text = "Score = \(score)"
        addChild(scoreLabel)
    }
    
    func createInvisibleTopWall() {
        topWall = SKSpriteNode(color: .clear, size: CGSize(width: size.height + 40, height: 2))
        topWall.position = CGPoint(x: 0, y: beachBackgroundNodesArray[0].frame.maxY - 10)
        topWall.zPosition = 3
        addChild(topWall)
    }
    
    func createInvisibleBottomWall() {
        bottomWall = SKSpriteNode(color: .clear, size: CGSize(width: size.height + 40, height: 2))
        bottomWall.position = CGPoint(x: 0, y: beachBackgroundNodesArray[0].frame.midY - 10)
        bottomWall.zPosition = 3
        addChild(bottomWall)
    }
    
    func createGreenTrash() {
        greenTrash = SKSpriteNode(imageNamed: "recycle-green-wlabel")
        greenTrash.size = CGSize(width: screenWidth * 0.09, height: screenHeight * 0.18)
        greenTrash.position = CGPoint(x: screenWidth / 2 - (upArrow.frame.width / 2) - screenWidth * 0.06, y: -(screenHeight / 2) + (greenTrash.frame.height / 2) + screenHeight * 0.05)
        greenTrash.zPosition = 2
        addChild(greenTrash)
    }
    
    func createYellowTrash() {
        yellowTrash = SKSpriteNode(imageNamed: "recycle-yellow-wlabel")
        yellowTrash.size = greenTrash.size
        yellowTrash.position = CGPoint(x: greenTrash.frame.minX - yellowTrash.frame.width / 2 - screenWidth * 0.047, y: greenTrash.position.y)
        yellowTrash.zPosition = 2
        addChild(yellowTrash)
    }
    
    func createBlueTrash() {
        blueTrash = SKSpriteNode(imageNamed: "recycle-blue-wlabel")
        blueTrash.size = yellowTrash.size
        blueTrash.position = CGPoint(x: yellowTrash.frame.minX - blueTrash.frame.width / 2 - screenWidth * 0.047, y: yellowTrash.position.y)
        blueTrash.zPosition = 2
        addChild(blueTrash)
    }
    
    func createRedTrash() {
        redTrash = SKSpriteNode(imageNamed: "recycle-red-wlabel")
        redTrash.size = blueTrash.size
        redTrash.position = CGPoint(x: blueTrash.frame.minX - redTrash.frame.width / 2 - screenWidth * 0.047, y: blueTrash.position.y)
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
            let beachBackground = addIndividualSprite(texture: imageName, size: CGSize(width: screenWidth, height: screenHeight * 0.58), zPosition: 1, anchorPoint: CGPoint(x: 1, y: 0.5))
            beachBackground.position = CGPoint(x: beachBackground.size.width * CGFloat(i), y: -(screenHeight / 2) + beachBackground.frame.height / 2)
            addChild(beachBackground)
            beachBackgroundArray.append(imageName)
            beachBackgroundNodesArray.append(beachBackground)
        }
    }
    
    func createCityNodes() {
        for i in 0...2 {
            let imageName = "city\(i)"
            let cityBackground = addIndividualSprite(texture: imageName, size: CGSize(width: screenWidth, height: screenHeight * 0.43), zPosition: 1, anchorPoint: CGPoint(x: 1, y: 0.5))
            cityBackground.position = CGPoint(x: cityBackground.size.width * CGFloat(i), y: screenHeight / 2 - cityBackground.frame.height / 2)
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
        currentTrashText = textureName
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
        currentTexture = currentTrashText
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
            let trashAnimationAct = SKAction.animate(with: blueTrashTextures, timePerFrame: 0.13)
            
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
            
            let delayAction = SKAction.wait(forDuration: Double(blueTrashTextures.count) * 0.13)
            
            let removeAction = SKAction.run {
                self.currentTrash.removeAction(forKey: "animateTexture")
            }

            currentTrash.run(SKAction.sequence([delayAction, removeAction]))
        case "rec-red01":
            let trashAnimationAct = SKAction.animate(with: redTrashTextures, timePerFrame: 0.13)
            
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
            
            let delayAction = SKAction.wait(forDuration: Double(redTrashTextures.count) * 0.13)
            
            let removeAction = SKAction.run {
                self.currentTrash.removeAction(forKey: "animateTexture")
            }
            
            currentTrash.run(SKAction.sequence([delayAction, removeAction]))
        case "rec-yellow01":
            let trashAnimationAct = SKAction.animate(with: yellowTrashTextures, timePerFrame: 0.13)
            
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
            
            let delayAction = SKAction.wait(forDuration: Double(yellowTrashTextures.count) * 0.13)
            
            let removeAction = SKAction.run {
                self.currentTrash.removeAction(forKey: "animateTexture")
            }
            
            currentTrash.run(SKAction.sequence([delayAction, removeAction]))
        case "rec-green01":
            let trashAnimationAct = SKAction.animate(with: greenTrashTextures, timePerFrame: 0.13)
            
            currentTrash.run(trashAnimationAct, withKey: "animateTexture")
            
            let delayAction = SKAction.wait(forDuration: Double(greenTrashTextures.count) * 0.13)
            
            let removeAction = SKAction.run {
                self.currentTrash.removeAction(forKey: "animateTexture")
            }
            
            currentTrash.run(SKAction.sequence([delayAction, removeAction]))
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
        changeTrashTexture(textureName: currentTexture)
    }
    
    func removeAnimationTexture() {
        self.currentTrash.removeAction(forKey: "animateTexture")
    }
    
    func initilizeConstants() {
        mapScrollSpeed = constants.getBaseGameSpeed()
        playerMoveSpeed = constants.getPlayerMoveSpeed()
        screenMaxX = constants.getScreenMaxX()
        screenMinX = constants.getScreenMinX()
        screenMinY = constants.getScreenMinY()
        screenMaxY = constants.getScreenMaxY()
        screenHeight = constants.getScreenHeight()
        screenWidth = constants.getScreenWidth()
        blueTrashTextures = constants.getBlueTrashArray()
        redTrashTextures = constants.getRedTrashArray()
        yellowTrashTextures = constants.getYellowTrashArray()
        greenTrashTextures = constants.getGreenTrashArray()
    }
}

