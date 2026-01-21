//
//  NavigationBarScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/16.
//

import SwiftUI
import SwiftData

struct NavigationBarScreen: View {
    let logService: LogService
    let userService: UserService
    
    var body: some View {
        VStack{
            TabView {
                Tab("Home", systemImage: "house.fill"){
                    NavigationStack{
                        HomeScreen(logService: logService)
                    }
                }
                Tab("Library", systemImage: "books.vertical"){
                    NavigationStack{
                        LibraryScreen(logService: logService)
                    }
                }
                Tab("Search", systemImage: "magnifyingglass"){
                    SearchScreen()
                }
            }
        }
    }
}
