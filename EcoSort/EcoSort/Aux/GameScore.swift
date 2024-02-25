//
//  GameScore.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import SpriteKit

struct GameScore {
    // Singleton variable to share GameScore
    static let shared = GameScore()
    
    private init(){}
    
    private var gameScore = 0
    
    func getGameScore() -> Int {
        return gameScore
    }
}
