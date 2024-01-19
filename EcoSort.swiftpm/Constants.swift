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
    private var baseGameSpeed = 5
    private var gameScore = 10
    
    func getMenuSpeed() -> Int {
        return menuSpeed
    }
    
    func getBaseGameSpeed() -> Int {
        return baseGameSpeed
    }
    
    func getGameScore() -> Int {
        return gameScore
    }
}
