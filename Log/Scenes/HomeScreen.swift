//
//  HomeScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var userSession: UserSession
    let logService: LogService
    
    @State var newLogSheetVisibility: Bool = false
    @State var category: LogCategory = .movie
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(userSession.currentUser != nil ? "Welcome \(userSession.currentUser!.name)" : "No user")
                AddLogButton(action: {newLogSheetVisibility.toggle()})
            }
            .toolbar{
                
            }
            .toolbarTitleDisplayMode(.inlineLarge)
            .sheet(isPresented: $newLogSheetVisibility){
                AddLogSheet(logService: logService, category: $category)
            }
            .navigationTitle("Home")
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
