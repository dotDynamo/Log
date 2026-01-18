//
//  LibraryScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

struct LibraryScreen: View {
    @EnvironmentObject var userSession: UserSession
    @State var newLogSheetVisibility: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("This is the library")
                AddLogButton(action: {newLogSheetVisibility.toggle()})
            }
            .toolbarTitleDisplayMode(.inlineLarge)
            .sheet(isPresented: $newLogSheetVisibility){
                AddLogSheet()
            }
            .navigationTitle("Library")
        }
        .overlay(
            VStack {
                HStack {
                    Spacer()
                    if let currentUser = userSession.currentUser {
                        UserView(user: currentUser, showUsername: false, size: .small).padding(.trailing)
                    }
                }
                Spacer()
            }
        )
    }
}

#Preview {
    LibraryScreen()
}
