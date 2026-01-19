//
//  AddLogSheet.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

enum LogCategory{
    case movie
    case series
    case music
    case book
    case game
}

struct AddLogSheet: View {
    @Environment(\.dismiss) var dismiss
    let logService: LogService
    
    @State var category: LogCategory = .book
    
    @State var title: String = ""
    @State var releaseDate: Date = Date.now
    @State var status: Status = .inQueue
    @State var startDate: Date = Date.now
    @State var finishDate: Date = Date.now
    @State var rating: Double = 0.0
    @State var recommendedBy: String = ""
    @State var notes: String = ""
    
    @State var artist: String = ""
    @State var album: String = ""
    @State var releaseType: ReleaseType = .single
    @State var songs: [Song] = []
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Category").foregroundStyle(.gray).bold()) {
                    Picker("Category", selection: $category) {
                        Image(systemName: "film.fill").tag(LogCategory.movie)
                        Image(systemName: "tv.fill").tag(LogCategory.series)
                        Image(systemName: "music.note").tag(LogCategory.music)
                        Image(systemName: "book.fill").tag(LogCategory.book)
                        Image(systemName: "gamecontroller.fill").tag(LogCategory.game)
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("General info").foregroundStyle(.gray).bold()){
                    TextField("Title", text: $title)
                    
                    switch(category){
                    case .movie:
                        AddMovieSection()
                    case .series:
                        AddSeriesSection()
                    case .music:
                        AddMusicSection(artist: $artist, album: $album, releaseType: $releaseType)
                    case .book:
                        AddBookSection()
                    case .game:
                        AddGameSection()
                    }
                    DatePicker("Release date", selection: $releaseDate,displayedComponents: [.date])
                }
                
                if category == .music && (releaseType == .album || releaseType == .EP) {
                    AddTracklistView(songs: $songs)
                }

                Section(header: Text("Status").foregroundStyle(.gray).bold()){
                    Picker("Status", selection: $status){
                        Text(LogUtils.addStatusToText(status: .inQueue, category: category)).tag(Status.inQueue)
                        Text(LogUtils.addStatusToText(status: .inProgress, category: category)).tag(Status.inProgress)
                        Text("Completed").tag(Status.completed)
                        Text("Dropped").tag(Status.dropped)
                    }.pickerStyle(.segmented)
                }

                Section(header: Text("Extra info").foregroundStyle(.gray).bold()){
                    if status == .completed{
                        DatePicker("Start date",
                                   selection: $startDate,
                                   in: releaseDate...Date.now,
                                   displayedComponents: [.date])
                        DatePicker("Finish date",
                                   selection: $finishDate,
                                   in: startDate...Date.now,
                                   displayedComponents: [.date])
                        HStack{
                            Text("Rating")
                            Spacer()
                            RatingPicker(rating: $rating)
                        }
                    } else if status == .inProgress || status == .dropped {
                        DatePicker("Start date",
                                   selection: $startDate,
                                   in: releaseDate...Date.now,
                                   displayedComponents: [.date])
                        if status == .dropped{
                            HStack{
                                Text("Rating")
                                Spacer()
                                RatingPicker(rating: $rating)
                            }
                        }
                    }
                    TextField("Recommended by", text: $recommendedBy)
                    TextField("Notes...", text: $notes, axis: .vertical)
                }
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button(role: .cancel){ dismiss()}
                }
            }
            Button("Log It"){
                switch(category){
                case .movie:
                    logService.addMovieLog()
                case .series:
                    logService.addSeriesLog()
                case .music:
                    logService.addMusicLog(title: title, artist: artist, releaseType: releaseType, satus: status)
                case .book:
                    logService.addBookLog()
                case .game:
                    logService.addGameLog()
                }
            }
            .buttonSizing(.flexible)
            .buttonStyle(.glassProminent)
            .padding()
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext) var modelContext
    let logService = LogService(modelContext: modelContext)
    AddLogSheet(logService: logService)
}
