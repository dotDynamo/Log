//
//  LogApp.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import SwiftData
import SwiftUI

@main
struct LogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            Log.self,
            MusicLog.self,
            MovieLog.self,
            SeriesLog.self,
            BookLog.self,
            GameLog.self,
            Run.self,
            Tag.self,
            User.self
        ])
    }
}
