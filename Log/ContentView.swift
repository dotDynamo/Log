//
//  ContentView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    var user = User(username: "User", name: "User", paternalSurname: "User")
    
    var body: some View {
       NavigationBar()
    }
}

#Preview {
    ContentView()
}
