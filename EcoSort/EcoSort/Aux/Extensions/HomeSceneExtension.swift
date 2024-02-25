//
//  HomeSceneExtension.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import SpriteKit

// MARK: - Node Creation
extension HomeSceneController {
    func createBackground() {
        background = SKSpriteNode(color: .black, size: CGSize(width: screenWidth, height: screenHeight))
        background.alpha = 0.4
        background.zPosition = 2
        addChild(background)
    }
    
    func createPlayButton() {
        playButton = SKSpriteNode(imageNamed: "play-button")
        playButton.size = CGSize(width: screenWidth * 0.18, height: screenHeight * 0.12)
        playButton.position = CGPoint(x: 0, y: (-(screenHeight / 2) + (playButton.size.height / 2)) + screenHeight * 0.1)
        playButton.zPosition = 3
        addChild(playButton)
    }
    
    func createLogo() {
        logo = SKSpriteNode(imageNamed: "logo0")

        let isIphone: Bool = checkUIDevice()
        
        if isIphone {
            logo.size = CGSize(width: screenWidth * 0.51, height: screenHeight * 0.33)
            logo.position = CGPoint(x: -(screenWidth / 2) + logo.frame.width / 2 + screenWidth * 0.20, y: 0)
        } else {
            logo.size = CGSize(width: screenWidth * 0.56, height: screenHeight * 0.23)
            logo.position = CGPoint(x: -(screenWidth / 2) + logo.frame.width / 2 + screenWidth * 0.16, y: 0)
        }
        

        logo.zPosition = 3
        addChild(logo)
    }
    
    func checkUIDevice() -> Bool {
        UIDevice.current.userInterfaceIdiom == .phone ? print("iPhone") : print("iPad")
        UIDevice.current.userInterfaceIdiom == .phone ? true : false
    }
    
    func createRecycleSymbol() {
        recycleSymbol = SKSpriteNode(imageNamed: "recycle-symbol")
        
        let isIphone: Bool = checkUIDevice()
        
        if isIphone {
            recycleSymbol.size = CGSize(width: screenWidth * 0.086, height: screenHeight * 0.16)
            recycleSymbol.position = CGPoint(x: logo.frame.maxX + recycleSymbol.frame.width / 2 + screenWidth * 0.01, y: logo.frame.maxY - recycleSymbol.frame.height / 2)
        } else {
            recycleSymbol.size = CGSize(width: screenWidth * 0.095, height: screenHeight * 0.11)
            recycleSymbol.position = CGPoint(x: logo.frame.maxX + recycleSymbol.frame.width / 2 + screenWidth * 0.02, y: logo.frame.maxY - recycleSymbol.frame.height / 2)
        }
        
        recycleSymbol.zPosition = 3
        addChild(recycleSymbol)
    }
    
    func createBeachNodes() {
        for i in 0...2 {
            let imageName = "beach\(i)"
            let beachBackground = addIndividualSprite(texture: imageName, size: CGSize(width: screenWidth, height: screenHeight * 0.58), zPosition: 1, anchorPoint: CGPoint(x: 1, y: 0.5))
            beachBackground.position = CGPoint(x: beachBackground.size.width * CGFloat(i), y: -(screenHeight / 2) + beachBackground.frame.height / 2)
            addChild(beachBackground)
            beachBackgroundArray.append(imageName)
            beachBackgroundNodesArrays.append(beachBackground)
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
extension HomeSceneController {
    func addLogoAnimation() {
        let logoAnimation = SKAction.animate(with: logoTextures, timePerFrame: 1)
        let infiniteLogoAnimation = SKAction.repeatForever(logoAnimation)
        logo.run(infiniteLogoAnimation)
    }
    
    func addRotateAction() {
        guard let rotateSymbolAction = rotateAction else { return }
        recycleSymbol.run(rotateSymbolAction)
    }
}

// MARK: - Aux Methods
extension HomeSceneController {
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
    
    func initializeConstants() {
        mapScrollSpeed = constants.getMenuSpeed()
        screenMaxX = constants.getScreenMaxX()
        screenMinX = constants.getScreenMinX()
        screenMaxY = constants.getScreenMaxY()
        screenMinY = constants.getScreenMinY()
        screenHeight = constants.getScreenHeight()
        screenWidth = constants.getScreenWidth()
        logoTextures = constants.getLogoTextures()
    }
}
