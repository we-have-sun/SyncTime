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
            ContentView()
        }
        .modelContainer(for: Project.self)
    }
}
