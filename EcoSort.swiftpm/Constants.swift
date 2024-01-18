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
    
    private var speed = 1
    
    func getSpeed() -> Int {
        return speed
    }
}
