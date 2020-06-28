//
//  g_playerApp.swift
//  g_player WatchKit Extension
//
//  Created by garrepi on 6/27/20.
//

import SwiftUI

@main
struct g_playerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
