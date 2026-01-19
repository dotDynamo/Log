//
//  ContentView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \User.name) private var users: [User]
    
    var userService: UserService {
        UserService(userSession: _userSession, modelContext: modelContext) 
    }
    
    var logService: LogService {
        LogService(modelContext: modelContext)
    }
    
    var body: some View {
        Group {
            if users.isEmpty {
                OnboardingScreen(userService: userService)
            } else if userSession.currentUser != nil {
                NavigationBarScreen(logService: logService, userService: userService)
            } else {
                UserSelectionScreen()
            }
        }
        .onAppear {
            if userSession.currentUser == nil,
               let idString = UserDefaults.standard.string(forKey: "currentUserId"),
               let uuid = UUID(uuidString: idString)
            {
                let descriptor = FetchDescriptor<User>(predicate: #Predicate { $0.id == uuid })
                if let user = try? modelContext.fetch(descriptor).first {
                    userSession.currentUser = user
                }
            }
        }
    }
}
