//
//  Constants.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import SpriteKit

struct Constants {
    // Speed
    private var menuSpeed = 1
    private var baseGameSpeed = 5.0
    private var playerMoveSpeed = 3.0
    
    // Bounds
    private var screenMaxX = UIScreen.main.bounds.maxX
    private var screenMinX = UIScreen.main.bounds.minX
    private var screenMaxY = UIScreen.main.bounds.maxY
    private var screenMinY = UIScreen.main.bounds.minY
    private var screenHeight = UIScreen.main.bounds.height
    private var screenWidht = UIScreen.main.bounds.width
    
    // Items sizes
    private var item16xWidth = 0.04
    private var item16xHeight = 0.06
    private var item32xWidth = 0.06
    private var item32xHeight = 0.04
    
    // Items textures
    private var paperTextures = [
        SKTexture(imageNamed: "paper-plane"),
        SKTexture(imageNamed: "newspaper")
    ]
    
    private var glassTextures = [
        SKTexture(imageNamed: "wine"),
        SKTexture(imageNamed: "glass-bottle")
    ]
    
    private var plasticTextures = [
        SKTexture(imageNamed: "plastic-bag"),
        SKTexture(imageNamed: "water-bottle")
    ]
    
    private var metalTextures  = [
        SKTexture(imageNamed: "metal-can"),
        SKTexture(imageNamed: "can-opened")
    ]
    
    // Font
    private let fontURL = Bundle.module.url(forResource: "PressStart2P-Regular", withExtension: "ttf")!
    
    private var dialoguesBoxes =  [
        SKTexture(imageNamed: "dialogue-box01"),
        SKTexture(imageNamed: "dialogue-box02"),
        SKTexture(imageNamed: "dialogue-box03"),
        SKTexture(imageNamed: "dialogue-box04"),
        SKTexture(imageNamed: "dialogue-box05"),
        SKTexture(imageNamed: "dialogue-box06")
    ]
    
    private var elderlyWomanTextures = [
        SKTexture(imageNamed: "elderly-woman01"),
        SKTexture(imageNamed: "elderly-woman02"),
        SKTexture(imageNamed: "elderly-woman01"),
        SKTexture(imageNamed: "elderly-woman03")
    ]
    
    private var redTrashArray = [
        SKTexture(imageNamed: "rec-red01"),
        SKTexture(imageNamed: "rec-red02"),
        SKTexture(imageNamed: "rec-red03"),
        SKTexture(imageNamed: "rec-red02"),
        SKTexture(imageNamed: "rec-red01")
    ]
    
    private var greenTrashArray = [
        SKTexture(imageNamed: "rec-green01"),
        SKTexture(imageNamed: "rec-green02"),
        SKTexture(imageNamed: "rec-green03"),
        SKTexture(imageNamed: "rec-green02"),
        SKTexture(imageNamed: "rec-green01")
    ]
    
    private var yellowTrashArray = [
        SKTexture(imageNamed: "rec-yellow01"),
        SKTexture(imageNamed: "rec-yellow02"),
        SKTexture(imageNamed: "rec-yellow03"),
        SKTexture(imageNamed: "rec-yellow02"),
        SKTexture(imageNamed: "rec-yellow01")
    ]
    
    private var blueTrashArray = [
        SKTexture(imageNamed: "rec-blue01"),
        SKTexture(imageNamed: "rec-blue02"),
        SKTexture(imageNamed: "rec-blue03"),
        SKTexture(imageNamed: "rec-blue02"),
        SKTexture(imageNamed: "rec-blue01")
    ]
    
    private var logoTextures = [
        SKTexture(imageNamed: "logo0"),
        SKTexture(imageNamed: "logo1"),
        SKTexture(imageNamed: "logo2"),
        SKTexture(imageNamed: "logo0")
    ]
    
    private var heartTextures = [
        SKTexture(imageNamed: "heart0"),
        SKTexture(imageNamed: "heart1"),
        SKTexture(imageNamed: "heart2"),
        SKTexture(imageNamed: "heart3")
    ]
    
    // Getters
    func getMenuSpeed() -> Int {
        return menuSpeed
    }
    
    func getBaseGameSpeed() -> Double {
        return baseGameSpeed
    }
    
    func getPlayerMoveSpeed() -> Double {
        return playerMoveSpeed
    }
    
    func getScreenMaxX() -> CGFloat {
        return screenMaxX
    }
    
    func getScreenMinX() -> CGFloat {
        return screenMinX
    }
    
    func getScreenMaxY() -> CGFloat {
        return screenMaxY
    }
    
    func getScreenMinY() -> CGFloat {
        return screenMinY
    }
    
    func setupCustomFont() {
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
    }
    
    func getDialogueBoxes() -> [SKTexture] {
        return dialoguesBoxes
    }
    
    func getElderlyWomanTextures() -> [SKTexture] {
        return elderlyWomanTextures
    }
    
    func getRedTrashArray() -> [SKTexture] {
        return redTrashArray
    }
    
    func getGreenTrashArray() -> [SKTexture] {
        return greenTrashArray
    }
    
    func getYellowTrashArray() -> [SKTexture] {
        return yellowTrashArray
    }
    
    func getBlueTrashArray() -> [SKTexture] {
        return blueTrashArray
    }
    
    func getLogoTextures() -> [SKTexture] {
        return logoTextures
    }
    
    func getPaperTextures() -> [SKTexture] {
        return paperTextures
    }
    
    func getGlassTextures() -> [SKTexture] {
        return glassTextures
    }
    
    func getPlasticTextures() -> [SKTexture] {
        return plasticTextures
    }
    
    func getMetalTextures() -> [SKTexture] {
        return metalTextures
    }
    
    func getHeartTextures() -> [SKTexture] {
        return heartTextures
    }
    
    func getScreenHeight() -> CGFloat {
        return screenHeight
    }
    
    func getScreenWidth() -> CGFloat {
        return screenWidht
    }
    
    func getItem16xWidth() -> CGFloat {
        return item16xWidth
    }
    
    func getItem16xHeight() -> CGFloat {
        return item16xHeight
    }
    
    func getItem32xWidth() -> CGFloat  {
        return item32xWidth
    }
    
    func getItem32xHeight() -> CGFloat  {
        return item32xHeight
    }
}
