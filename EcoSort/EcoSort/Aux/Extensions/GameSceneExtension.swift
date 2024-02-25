//
//  GameSceneExtension.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import SpriteKit

// MARK: - Node Creation
extension GameSceneController {
    func createPlayerNode() {
        player = SKSpriteNode(imageNamed: "player01")
        
        if isIphone {
            player.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.18)
        } else {
            player.size = CGSize(width: screenWidth * 0.059, height: screenHeight * 0.16)
        }
        
        player.position = CGPoint(x: -(screenWidth / 2) + player.frame.width / 2 + screenWidth * 0.19, y: 0)
        player.zPosition = 4
        addChild(player)
    }
    
    func createDownArrow() {
        downArrow = SKSpriteNode(imageNamed: "arrow-down")
        
        if isIphone {
            downArrow.size = CGSize(width: screenWidth * 0.07, height: screenHeight * 0.15)
        } else {
            downArrow.size = CGSize(width: screenWidth * 0.088, height: screenHeight * 0.12)
        }
        
        downArrow.position = CGPoint(x: -(screenWidth / 2) + (downArrow.frame.width / 2) + screenWidth * 0.06, y: -(screenHeight / 2) + (downArrow.frame.height / 2) + screenHeight * 0.029)
        downArrow.zPosition = 2
        addChild(downArrow)
    }
    
    func createUpArrow() {
        upArrow = SKSpriteNode(imageNamed: "arrow-up")
        
        if isIphone {
            upArrow.size = CGSize(width: screenWidth * 0.07, height: screenHeight * 0.15)
        } else {
            upArrow.size = CGSize(width: screenWidth * 0.088, height: screenHeight * 0.12)
        }
        
        upArrow.position = CGPoint(x: -(screenWidth / 2) + (upArrow.frame.width / 2) + screenWidth * 0.06, y: downArrow.frame.maxY + upArrow.frame.height / 2 + screenHeight * 0.008)
        upArrow.zPosition = 2
        addChild(upArrow)
    }
    
    func createScoreNode() {
        scoreNode = SKSpriteNode(imageNamed: "score-box")
        
        if isIphone {
            scoreNode.size = CGSize(width: screenWidth * 0.19, height: screenHeight * 0.1)
        } else {
            scoreNode.size = CGSize(width: screenWidth * 0.28, height: screenHeight * 0.088)
        }

        scoreNode.position = CGPoint(x: screenWidth / 2 - (scoreNode.frame.width / 2) - screenWidth * 0.023, y: screenHeight / 2 - (scoreNode.frame.height / 2) - screenHeight * 0.032)
        scoreNode.zPosition = 2
        scoreNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(scoreNode)
    }
    
    func createScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "PressStart2P-Regular")
        
        var fontSizePercentage: CGFloat = 0.0
        
        if isIphone {
            fontSizePercentage = 1.4
        } else {
            fontSizePercentage = 2
        }
        
        let fontSize = screenWidth * fontSizePercentage / 100.0
        
        scoreLabel.position = CGPoint(x: scoreNode.frame.midX, y: scoreNode.frame.midY)
        scoreLabel.zPosition = 3
        scoreLabel.fontSize = fontSize
        scoreLabel.fontColor = .init(hex: "FFEFD7")
        scoreLabel.text = "Score: \(GameScore.shared.gameScore)/\(winValue)"
        scoreLabel.verticalAlignmentMode = .center
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
        
        if isIphone {
            greenTrash.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.17)
        } else {
            greenTrash.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.12)
        }
        
        greenTrash.position = CGPoint(x: screenWidth / 2 - (upArrow.frame.width / 2) - screenWidth * 0.14, y: -(screenHeight / 2) + (greenTrash.frame.height / 2) + screenHeight * 0.02)
        greenTrash.zPosition = 3
        greenTrash.alpha = 0.5
        addChild(greenTrash)
    }
    
    func createYellowTrash() {
        yellowTrash = SKSpriteNode(imageNamed: "recycle-yellow-wlabel")
        yellowTrash.size = greenTrash.size
        yellowTrash.position = CGPoint(x: greenTrash.position.x, y: greenTrash.frame.maxY + yellowTrash.frame.height / 2 + screenHeight * 0.03)
        yellowTrash.zPosition = 3
        yellowTrash.alpha = 0.5
        addChild(yellowTrash)
    }
    
    func createBlueTrash() {
        blueTrash = SKSpriteNode(imageNamed: "recycle-blue-wlabel")
        blueTrash.size = yellowTrash.size
        blueTrash.position = CGPoint(x: yellowTrash.frame.minX - blueTrash.frame.width / 2 - screenWidth * 0.02, y: (yellowTrash.frame.minY + greenTrash.frame.maxY) / 2)
        blueTrash.zPosition = 3
        blueTrash.alpha = 0.5
        addChild(blueTrash)
    }
    
    func createRedTrash() {
        redTrash = SKSpriteNode(imageNamed: "recycle-red-wlabel")
        redTrash.size = blueTrash.size
        redTrash.position = CGPoint(x: yellowTrash.frame.maxX + redTrash.frame.width / 2 + screenWidth * 0.02, y: (yellowTrash.frame.minY + greenTrash.frame.maxY) / 2)
        redTrash.zPosition = 3
        redTrash.alpha = 1
        addChild(redTrash)
    }
    
    func createCurrentTrashCarried() {
        currentTrash = SKSpriteNode(imageNamed: "rec-red01")
        
        if isIphone {
            currentTrash.size = CGSize(width: screenWidth * 0.061, height: screenHeight * 0.163)
        } else {
            currentTrash.size = CGSize(width: screenWidth * 0.09, height: screenHeight * 0.12)
        }
        
        currentTrash.position = CGPoint(x: player.frame.minX, y: player.position.y)
        currentTrash.zPosition = 3
        addChild(currentTrash)
    }
    
    func createPaperItem() {
        paperItem = SKSpriteNode(imageNamed: "newspaper")
        
        if isIphone {
            paperItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.04)
        } else {
            paperItem.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.04)
        }
        
        paperItem.zPosition = 2
        paperItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(paperItem)
    }
    
    func createGlassItem() {
        glassItem = SKSpriteNode(imageNamed: "wine")
        
        if isIphone {
            glassItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.04)
        } else {
            glassItem.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.04)
        }
        
        glassItem.zPosition = 2
        glassItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(glassItem)
    }
    
    func createPlasticItem() {
        plasticItem = SKSpriteNode(imageNamed: "water-bottle")
        
        if isIphone {
            plasticItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.04)
        } else {
            plasticItem.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.04)
        }
        
        plasticItem.zPosition = 2
        plasticItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(plasticItem)
    }
    
    func createMetalItem() {
        metalItem = SKSpriteNode(imageNamed: "metal-can")
        
        if isIphone {
            metalItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.09)
        } else {
            metalItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.06)
        }
        
        metalItem.zPosition = 2
        metalItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        addChild(metalItem)
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

// MARK: - Actions
extension GameSceneController {
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
    
    func removeMoveUpAction() {
        isMovingUp = false
        player.removeAction(forKey: "moveUp")
    }
    
    func removeMoveDownAction() {
        isMovingDown = false
        player.removeAction(forKey: "moveDown")
    }
    
    func setupItensMove() {
        movePaper = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        moveGlasses = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        movePlastic = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        moveMetal = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
    }
    
    func removeAnimationTexture() {
        self.currentTrash.removeAction(forKey: "animateTexture")
    }
    
    func runHeartBrokenAnimation(node: SKSpriteNode) {
        if heartsGone < hearts.count  {
            let heartBrokenAnimation = SKAction.animate(with: heartTextures, timePerFrame: 0.15)
            node.run(heartBrokenAnimation, withKey: "heartAnimation")
            let delayAction = SKAction.wait(forDuration: Double(heartTextures.count) * 0.15)
            let fadeOutAction = SKAction.fadeAlpha(to: 0.0, duration: 0.2)
            let removeAction = SKAction.run {
                node.removeAction(forKey: "heartAnimation")
                node.alpha = 0.0
            }

            node.run(SKAction.sequence([delayAction, fadeOutAction, removeAction]))
            
            heartsGone += 1
        }
    }
}


// MARK: - Aux Methods
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
        greenTrash.alpha = 0.5
        yellowTrash.alpha = 0.5
        blueTrash.alpha = 0.5
        redTrash.alpha = 0.5
    }
    
    func changeCurrentTrashAlpha(trashNode: SKNode) {
        trashNode.alpha = 1
    }
    
    func updateCurrentTrashPosition() {
        currentTrash.position = CGPoint(x: player.frame.minX, y: player.position.y + 20)
        currentTexture = currentTrashText
    }
    
    func updatePlayerPosition() {
        player.position = CGPoint(x: player.position.x, y: value)
    }
    
    func setUpdateConditionsForNodes(node: SKNode) {
        switch (node) {
        case paperItem:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(movePaper, withKey: "movePaper")
            } else {
                if heartsGone < hearts.count {
                    node.removeAction(forKey: "movePaper")
                    runHeartBrokenAnimation(node: hearts[heartsGone])
                    
                    runPlayerDamageAnimation()

                    resetPaper()
                    
                    checkToReset()
                } else {
                    resetGame()
                }
            }
        case glassItem:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(moveGlasses, withKey: "moveGlasses")
            } else {
                if heartsGone < hearts.count {
                    node.removeAction(forKey: "moveGlasses")
                    runHeartBrokenAnimation(node: hearts[heartsGone])
                    
                    runPlayerDamageAnimation()

                    resetGlass()
                    
                    checkToReset()
                } else {
                    resetGame()
                }
            }
        case plasticItem:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(movePlastic, withKey: "movePlastic")
            } else {
                if heartsGone < hearts.count {
                    node.removeAction(forKey: "movePlastic")
                    runHeartBrokenAnimation(node: hearts[heartsGone])
                    
                    runPlayerDamageAnimation()

                    resetPlastic()
                    
                    checkToReset()
                } else {
                    resetGame()
                }
            }
        case metalItem:
            if node.position.x > frame.minX {
                isMovingScreenLimit = true
                node.run(moveMetal, withKey: "moveMetal")
            } else {
                if heartsGone < hearts.count {
                    node.removeAction(forKey: "moveMetal")
                    runHeartBrokenAnimation(node: hearts[heartsGone])
                    
                    runPlayerDamageAnimation()

                    resetMetal()
                    
                    checkToReset()
                } else {
                    resetGame()
                }
            }
        default:
            print("Error")
        }
    }
    
    func checkToReset() {
        if  heartsGone == hearts.count {
            resetGame()
        }
    }
    
    func resetGame() {
        self.player.removeAllActions()
        self.currentTrash.removeAction(forKey: "animateTexture")
        self.metalItem.removeAction(forKey: "moveMetal")
        self.paperItem.removeAction(forKey: "movePaper")
        self.glassItem.removeAction(forKey: "moveGlasses")
        self.plasticItem.removeAction(forKey: "movePlastic")
        self.isMovingUp = false
        self.isMovingDown = false
        self.isMovingScreenLimit = false
        self.isItemCollected = false
        self.value = 0.0
        self.paperMoveValue = 0.0
        self.glassMoveValue = 0.0
        self.plasticMoveValue = 0.0
        self.metalMoveValue = 0.0
        self.currentTrashText = "rec-red01"
        self.currentTexture = "rec-red01"
        self.heartsGone = 0
        GameScore.shared.gameScore = 0
        self.usedYPositions = Set<CGFloat>()
        
        AudioManager.shared.playGameOverSound()
        AudioManager.shared.restartDialogueMusic()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            let dialogueSceneController = DialogueSceneController(size: self.size)
            self.changeScene(to: dialogueSceneController, with: .gameOver)
        }
    }
    
    func generateRandomTexture(_ type: GarbageType) -> SKTexture {
        var randomIndex = 0
        var randomTexture = SKTexture()
        switch (type) {
        case .glass:
            randomIndex = randomSource.nextInt(upperBound: glassTextures.count)
            randomTexture = glassTextures[randomIndex]
        case .metal:
            randomIndex = randomSource.nextInt(upperBound: metalTextures.count)
            randomTexture = metalTextures[randomIndex]
        case .paper:
            randomIndex = randomSource.nextInt(upperBound: paperTextures.count)
            randomTexture = paperTextures[randomIndex]
        case .plastic:
            randomIndex = randomSource.nextInt(upperBound: plasticTextures.count)
            randomTexture = plasticTextures[randomIndex]
        }
        return randomTexture
    }
    
    func runPlayerDamageAnimation() {
        let fadeOut = SKAction.fadeAlpha(to: 0.2, duration: 0.1)
        let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 0.1)
        let blinkSequence = SKAction.sequence([fadeOut, fadeIn, fadeOut, fadeIn, fadeOut, fadeIn])

        player.run(blinkSequence)
    }
    
    func resetPaper() {
        isMovingScreenLimit = false
        paperMoveValue = 0
        
        sortNewPaperTexture()
        
        paperItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
            self.isMovingScreenLimit = true
        }
    }
    
    func sortNewPaperTexture() {
        let texture = generateRandomTexture(.paper)
        
        if isIphone {
            paperItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.04)
        } else {
            paperItem.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.04)
        }
        
        paperItem.texture = texture
    }
    
    func resetGlass() {
        isMovingScreenLimit = false
        glassMoveValue = 0
        
        sortNewGlassTexture()
        
        glassItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.isMovingScreenLimit = true
        }
    }
    
    func sortNewGlassTexture() {
        let texture = generateRandomTexture(.glass)
        
        if isIphone {
            glassItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.04)
        } else {
            glassItem.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.04)
        }
        
        glassItem.texture = texture
    }
    
    func resetPlastic() {
        isMovingScreenLimit = false
        plasticMoveValue = 0
        
        sortNewPlasticTexture()

        plasticItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.isMovingScreenLimit = true
        }
    }
    
    func sortNewPlasticTexture() {
        let texture = generateRandomTexture(.plastic)
        
        if isIphone {
            plasticItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.04)
        } else {
            plasticItem.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.04)
        }
        
        plasticItem.texture = texture
    }
    
    func resetMetal() {
        isMovingScreenLimit = false
        metalMoveValue = 0
        
        sortNewMetalTexture()
        
        metalItem.position = CGPoint(x: screenMaxX, y: generateRandomYPositionForNodes())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            self.isMovingScreenLimit = true
        }
    }
    
    func sortNewMetalTexture() {
        let texture = generateRandomTexture(.metal)
        
        if isIphone {
            metalItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.09)
        } else {
            metalItem.size = CGSize(width: screenWidth * 0.04, height: screenHeight * 0.06)
        }
        
        metalItem.texture = texture
    }
    
    func updateNodesPosition(node: SKNode) {
        switch (node) {
        case paperItem:
            paperItem.position = CGPoint(x: paperMoveValue + screenMaxX + 350, y: paperItem.position.y)
        case glassItem:
            glassItem.position = CGPoint(x: glassMoveValue + screenMaxX + 700, y: glassItem.position.y)
        case plasticItem:
            plasticItem.position = CGPoint(x: plasticMoveValue + screenMaxX + 1050, y: plasticItem.position.y)
        case metalItem:
            metalItem.position = CGPoint(x: metalMoveValue + screenMaxX + 1400, y: metalItem.position.y)
        default:
            print("Error")
        }
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
        GameScore.shared.gameScore += 1
        scoreLabel.text = "Score: \(GameScore.shared.gameScore)/\(winValue)"
        changeTrashTexture(textureName: currentTexture)
    }
    
    func initializeSpeed() {
        mapScrollSpeed = constants.getBaseGameSpeed()
        playerMoveSpeed = constants.getPlayerMoveSpeed()
    }
    
    func setupScreenBounds() {
        screenMaxX = constants.getScreenMaxX()
        screenMinX = constants.getScreenMinX()
        screenMinY = constants.getScreenMinY()
        screenMaxY = constants.getScreenMaxY()
        screenHeight = constants.getScreenHeight()
        screenWidth = constants.getScreenWidth()
    }
    
    func intiializeTrashes() {
        blueTrashTextures = constants.getBlueTrashArray()
        redTrashTextures = constants.getRedTrashArray()
        yellowTrashTextures = constants.getYellowTrashArray()
        greenTrashTextures = constants.getGreenTrashArray()
    }

    func initializeItemsTextures() {
        paperTextures = constants.getPaperTextures()
        glassTextures = constants.getGlassTextures()
        plasticTextures = constants.getPlasticTextures()
        metalTextures = constants.getMetalTextures()
    }
    
    func createHearts() {
        heart0 = SKSpriteNode(imageNamed: "heart0")
        if isIphone {
            heart0.size = CGSize(width: screenWidth * 0.047, height: screenHeight * 0.1)
        } else {
            heart0.size = CGSize(width: screenWidth * 0.06, height: screenHeight * 0.08)
        }
        heart0.position = CGPoint(x: -(screenWidth / 2) + heart0.frame.width / 2 + screenWidth * 0.16, y: screenHeight / 2 - heart0.frame.height / 2 - screenHeight * 0.03)
        heart0.zPosition = 2
        addChild(heart0)
        
        heart1 = SKSpriteNode(imageNamed: "heart0")
        heart1.size = heart0.size
        heart1.position = CGPoint(x: heart0.frame.minX - heart1.frame.width / 2 - screenWidth * 0.01, y: screenHeight / 2 - heart1.frame.height / 2 - screenHeight * 0.03)
        heart1.zPosition = 2
        addChild(heart1)
        
        heart2 = SKSpriteNode(imageNamed: "heart0")
        heart2.size = heart1.size
        heart2.position = CGPoint(x: heart1.frame.minX - heart2.frame.width / 2 - screenWidth * 0.01, y: screenHeight / 2 - heart2.frame.height / 2 - screenHeight * 0.03)
        heart2.zPosition = 2
        addChild(heart2)
    }
    
    func addHeartsToArray() {
        hearts.append(heart0)
        hearts.append(heart1)
        hearts.append(heart2)
    }
    
    func changeScene(to spriteScene: DialogueSceneController, with state: GameState) {
        let transition = SKTransition.fade(withDuration: 1)
        let scene = spriteScene
        
        scene.updateUI(state: state)
        
        self.view?.presentScene(scene, transition: transition)
    }
}
