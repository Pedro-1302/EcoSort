import SwiftUI
import SpriteKit

struct ContentView: View {
    let scene = SKScene(fileNamed: "HomeScene")
    
    var body: some View {
        VStack{
            if let scene {
                SpriteView(scene: scene)
            }
        }.ignoresSafeArea()
    }
}
