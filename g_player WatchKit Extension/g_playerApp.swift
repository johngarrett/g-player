import SwiftUI

@main
struct g_playerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
//                BrowseView()
//                NowPlayingView()
                UpNextView()
            }
        }
    }
}
