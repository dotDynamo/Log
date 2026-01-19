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
    @StateObject private var userSession = UserSession()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSession)
        }
        .modelContainer(for: Log.self)
    }
}
