//
//  NavigationBar.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/16.
//

import SwiftUI

enum Category{
    case book
    case game
    case series
    case movie
    case music
}

struct NavigationBar: View {
    var body: some View {
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

#Preview {
    NavigationBar()
}
