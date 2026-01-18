//
//  UserService.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
struct UserService{
    @EnvironmentObject var userSession: UserSession
    let modelContext: ModelContext
    
    func createUser(_ newUser: User){
        modelContext.insert(newUser)
        do{
            try modelContext.save()
        } catch {
            print("Failed to save user")
        }
        userSession.currentUser = newUser
        UserDefaults.standard.set(newUser.id.uuidString, forKey: "currentUserId")
    }
}
