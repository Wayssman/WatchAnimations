//
//  WatchAnimationsApp.swift
//  WatchAnimations WatchKit Extension
//
//  Created by Желанов Александр Валентинович on 23.10.2021.
//

import SwiftUI

@main
struct WatchAnimationsApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
