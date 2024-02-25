//
//  ContentView.swift
//  EcoSort
//
//  Created by Pedro Franco on 24/02/24.
//

import SwiftUI
import SpriteKit
 
struct ContentView: View {
    @State var currentScene: SKScene = HomeSceneController()
    
    var body: some View {
        SpriteView(scene: currentScene)
            .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    ContentView()
}
