//import SwiftUI
//import SpriteKit
//
//struct ContentView: View {
//    let scene = SKScene(fileNamed: "HomeScene")
//    
//    var body: some View {
//        VStack{
//            if let scene {
//                SpriteView(scene: scene)
//            }
//        }.ignoresSafeArea()
//    }
//}

import SwiftUI
import SpriteKit
 
struct ContentView: View {
    @State var currentScene: SKScene = HomeSceneController()
    
    var body: some View {
        SpriteView(scene: currentScene)
            .edgesIgnoringSafeArea(.all)
    }
}
