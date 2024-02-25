//
//  GameScore.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import SpriteKit

struct GameScore {
    // Singleton variable to share GameScore
    static var shared = GameScore()
    
    private init(){}
    
    var gameScore = 0
    private var winValue = 30
    
    func getWinValue() -> Int {
        return winValue
    }
}
