//
//  NavigationBarScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/16.
//

import SwiftUI
import SwiftData

struct NavigationBarScreen: View {
    @EnvironmentObject var userSession: UserSession
    let logService: LogService
    let userService: UserService
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {print("profile pressed")}){
                    UserView(user: userSession.currentUser!, showUsername: false, size: .small)
                        .padding()
                }
            }
            TabView {
                Tab("Home", systemImage: "house.fill"){
                    HomeScreen()
                }
                Tab("Library", systemImage: "books.vertical"){
                    LibraryScreen()
                }
                Tab("Search", systemImage: "magnifyingglass"){
                    SearchScreen()
                }
            }
        }
    }
}
