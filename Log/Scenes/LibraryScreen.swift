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
    @State private var user: User = User(username: "", name: "", paternalSurname: "", maternalSurname: "")
    
    var body: some View {
        NavigationView{
            VStack {
                Picker("Category", selection: $category){
                    Image(systemName: "film.fill").tag(LogCategory.movie)
                    Image(systemName: "tv.fill").tag(LogCategory.series)
                    Image(systemName: "music.note").tag(LogCategory.music)
                    Image(systemName: "book.fill").tag(LogCategory.book)
                    Image(systemName: "gamecontroller.fill").tag(LogCategory.game)
                }
                .pickerStyle(.segmented)
                .padding([.trailing, .leading, .top], 10)
                LogList(logService: logService)
            }
            .toolbarTitleDisplayMode(.inlineLarge)
            .sheet(isPresented: $newLogSheetVisibility){
                AddLogSheet(logService: logService, currentUser: user, category: $category)
            }
            .navigationTitle("Library")
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
                HStack {
                    Spacer()
                    AddLogButton(action: {newLogSheetVisibility.toggle()})
                }
            }
        )
    }
}
