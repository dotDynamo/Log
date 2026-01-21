//
//  LibraryScreen.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

struct LibraryScreen: View {
    @EnvironmentObject var userSession: UserSession
    let logService: LogService
    @State var newLogSheetVisibility: Bool = false
    
    @State var category: LogCategory = .movie
    
    var body: some View {
        NavigationStack{
            VStack{
                Picker("Category", selection: $category){
                    Image(systemName: "film.fill").tag(LogCategory.movie)
                    Image(systemName: "tv.fill").tag(LogCategory.series)
                    Image(systemName: "music.note").tag(LogCategory.music)
                    Image(systemName: "book.fill").tag(LogCategory.book)
                    Image(systemName: "gamecontroller.fill").tag(LogCategory.game)
                }
                .pickerStyle(.segmented)
                .padding()
                AddLogButton(action: {newLogSheetVisibility.toggle()})
            }
            .toolbarTitleDisplayMode(.inlineLarge)
            .sheet(isPresented: $newLogSheetVisibility){
                AddLogSheet(logService: logService, category: $category)
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
