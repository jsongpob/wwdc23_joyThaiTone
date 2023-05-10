import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Text("DO NOT USE THIS VIEW / PREVIEW ONLY")
            ClearView()
                .environmentObject(GameLevelData())
                .environmentObject(GameState())
        }
    }
}
