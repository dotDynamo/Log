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
                Text("Homeview goes here")
            }
            Tab("Library", systemImage: "books.vertical"){
                Text("Library goes here")
            }
            Tab("Search", systemImage: "magnifyingglass"){
                Text("SearchView goes here")
            }
        }
    }
}

#Preview {
    NavigationBar()
}
