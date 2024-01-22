//
//  Constants.swift
//  EcoSort
//
//  Created by Pedro Franco on 18/01/24.
//

import Foundation
import SpriteKit

class Constants {
    // Singleton variable to share Constants
    static let shared = Constants()
    
    private var menuSpeed = 1
    private var baseGameSpeed = 5.0
    private var gameScore = 0
    private var playerMoveSpeed = 5.0
    private var screenMaxX = UIScreen.main.bounds.maxX
    
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
}
