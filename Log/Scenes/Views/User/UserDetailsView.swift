//
//  UserDetailsView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/20.
//

import SwiftUI

struct UserDetailsView: View {
    @Binding var user: User
    var body: some View {
        VStack{
            UserView(user: $user, showUsername: true, size: .large)
        }
        .toolbar{
            ToolbarItem {
                NavigationLink(destination: UserEditView(user: $user)){
                    Label("Edit", systemImage: "square.and.pencil")
                }
            }
        }
    }
}
