import SwiftUI
import SpriteKit
 
struct ContentView: View {
    @State var currentScene: SKScene = HomeSceneController()
    
    var body: some View {
        SpriteView(scene: currentScene)
            .edgesIgnoringSafeArea(.all)
            //.onTapGesture(count: <#T##Int#>, perform: <#T##() -> Void#>)
    }
}

