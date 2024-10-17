//
//  SyncTimeApp.swift
//  SyncTime
//
//  Created by Nicho on 24/09/2024.
//

import SwiftUI
import SwiftData

@main
struct SyncTimeApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("List of task", systemImage: "list.triangle")
                    }
                Timers()
                    .tabItem {
                        Label("Timer", systemImage: "timer")
                    }
            }
        }
        .modelContainer(for: [Project.self, Time.self])
    }
}

