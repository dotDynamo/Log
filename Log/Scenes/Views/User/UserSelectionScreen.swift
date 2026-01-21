//
//  UserSelectionScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI
import SwiftData

struct UserSelectionScreen: View {
    @Query(sort: \User.name) private var users: [User]
    var body: some View {
        ForEach(users){ user in
            //UserView(user: $user)
        }
    }
}
