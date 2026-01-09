//
//  LogDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct LogDetailView: View {
    let log: Log
    var body: some View {
        VStack{
            
            
        }
        .navigationTitle(log.title)
        .toolbar(){
            Button(action: stub){
                Label("Edit", systemImage: "square.and.pencil").labelStyle(.iconOnly)
            }
        }
        .onAppear(){}
    }
    
    func stub(){
        print("Edit button")
    }
}

#Preview {
    let user: User = User(username: "diego", name: "Diego", paternalSurname: "Herrera", logs: [])
    let log: Log = GameLog(title: "Hollow Knight",
                       releaseDate: Date.now, rating: 5.4,
                       user: user, gameStudio: "Team Cherry", platform: "Nintendo Switch")
    LogDetailView(log: log)
}
