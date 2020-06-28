import SwiftUI

struct ContentView: View {
    var body: some View {
        NowPlayingView(PlayableContent("Swin", creator: "Francis and the lights", length: 2304, currentPosition: 1021))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
