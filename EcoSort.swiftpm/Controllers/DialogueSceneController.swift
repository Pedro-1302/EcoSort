//
//  DialogueSceneController.swift
//
//
//  Created by Pedro Franco on 24/01/24.
//

import SpriteKit

class DialogueSceneController: SKScene {
    var dialogueSceneBackground = SKSpriteNode()
    var currentDialogueBox = SKSpriteNode()
    var upArrow = SKSpriteNode()
    var downArrow = SKSpriteNode()
    
    var dialoguesBoxes =  [
        SKTexture(imageNamed: "dialogue01"),
        SKTexture(imageNamed: "dialogue02"),
        SKTexture(imageNamed: "dialogue03"),
        SKTexture(imageNamed: "dialogue04"),
        SKTexture(imageNamed: "dialogue05"),
        SKTexture(imageNamed: "dialogue06")
    ]
    
    override func sceneDidLoad() {
        createDialogueSceneBackground()
        createDialogueBox()
        createUpArrow()
        createDownArrow()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if upArrow.contains(location) {
                print("Up Arrow Clicked")
            }
            
            if downArrow.contains(location) {
                print("Down Arrow Clicked")
            }
        }
    }
}
