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
    @State private var user: User = User(username: "", name: "", paternalSurname: "")
    
    var body: some View {
        NavigationView{
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
            .onAppear(){
                if userSession.currentUser != nil { user = userSession.currentUser! }
            }
            .onChange(of: user) {
                userSession.currentUser = user
            }
        }
        .overlay(
            VStack {
                HStack {
                    Spacer()
                    UserView(user: $user, showUsername: false, size: .small, isClickable: true).padding(.trailing)
                }
                Spacer()
            }
        )
    }
}
