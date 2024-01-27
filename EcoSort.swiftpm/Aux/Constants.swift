//
//  Constants.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

struct Constants {
    // Singleton variable to share Constants
    static let shared = Constants()
    
    private init(){}
    
    private var menuSpeed = 1
    private var baseGameSpeed = 5.0
    private var gameScore = 0
    private var playerMoveSpeed = 5.0
    private var screenMaxX = UIScreen.main.bounds.maxX
    private var screenMinX = UIScreen.main.bounds.minX
    private var screenMaxY = UIScreen.main.bounds.maxY
    private var screenMinY = UIScreen.main.bounds.minY
    private var screenHeight = UIScreen.main.bounds.height
    private var screenWidht = UIScreen.main.bounds.width
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
        SKTexture(imageNamed: "elderly-woman03"),
        SKTexture(imageNamed: "elderly-woman04")
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
        SKTexture(imageNamed: "rec-green01")]
    
    private var yellowTrashArray = [
        SKTexture(imageNamed: "rec-yellow01"),
        SKTexture(imageNamed: "rec-yellow02"),
        SKTexture(imageNamed: "rec-yellow03"),
        SKTexture(imageNamed: "rec-yellow02"),
        SKTexture(imageNamed: "rec-yellow01")]
    
    private var blueTrashArray = [
        SKTexture(imageNamed: "rec-blue01"),
        SKTexture(imageNamed: "rec-blue02"),
        SKTexture(imageNamed: "rec-blue03"),
        SKTexture(imageNamed: "rec-blue02"),
        SKTexture(imageNamed: "rec-blue01")]
    
    func getMenuSpeed() -> Int {
        return menuSpeed
    }
    
    func getBaseGameSpeed() -> Double {
        return baseGameSpeed
    }
    
    func getGameScore() -> Int {
        return gameScore
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
    
    func getScreenHeight() -> CGFloat {
        return screenHeight
    }
    
    func getScreenWidth() -> CGFloat {
        return screenWidht
    }
}
