//
//  K.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import SpriteKit

struct K {
    // Speed
    private var menuSpeed = 1
    private var baseGameSpeed = 4.0
    private var playerMoveSpeed = 4.0
    
    // Bounds
    private var screenMaxX = UIScreen.main.bounds.maxX
    private var screenMinX = UIScreen.main.bounds.minX
    private var screenMaxY = UIScreen.main.bounds.maxY
    private var screenMinY = UIScreen.main.bounds.minY
    private var screenHeight = UIScreen.main.bounds.height
    private var screenWidht = UIScreen.main.bounds.width
    
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
    
    private var dialogues = [
        "Hi, my name is Emma, and i play a crucial role as a Waste Picker in the beach where i live.",
        "However, due to my age, i have been facing challenges in keeping the beach clean.",
        "Unfortunately, the beach is full of scattered recyclable materials that need to be collected urgently.",
        "Wow, look! Another recyclable item is coming! Now your mission will be to collect trash to clean the beach.",
        "The waste is categorized into metal, plastic, paper and glass.",
        "Come on, can you contribute to making our beach cleaner and more sustainable?"
    ]
    
    private var finishDialogues = [
        "Oooh, you did it! You have successfully cleaned all the recyclable trash from our beach!",
        "Cleaning beaches is essential to preserve our planet, protect marine life and reduce ocean contamination.",
        "Throughout the year, local environmental groups, city councils, and state agencies organize cleanup events.",
        "Stay up to date on beach cleanups in your country by contacting these environmental organizations.",
        "This way, you can significantly contribute to making our beaches cleaner.",
        "Remember, beach conservation is a shared responsibility. We couldn't do this without you!"
    ]
    
    private var gameOverDialogue = "You let a lot of trash through, but you can't keep me waiting! Come on, try again, you are sooo close!!!"
    
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
    
    func getDialogues() -> [String] {
        return dialogues
    }
    
    func getFinishDialogues() -> [String] {
        return finishDialogues
    }
    
    func getGameOverDialogue() -> String {
        return gameOverDialogue
    }
    
    static func checkUIDevice() -> Bool {
        UIDevice.current.userInterfaceIdiom == .phone ? print("iPhone") : print("iPad")
        return UIDevice.current.userInterfaceIdiom == .phone ? true : false
    }
}
