//
//  AddLogSheet.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

struct AddLogSheet: View {
    @Environment(\.dismiss) var dismiss
    let logService: LogService
    let currentUser: User
    
    @Binding var category: LogCategory
    
    @State var title: String = ""
    @State var releaseDate: Date = Date.now
    @State var status: Status = .inQueue
    @State var sameDate: Bool = true
    @State var startDate: Date = Date.now
    @State var finishDate: Date = Date.now
    @State var rating: Double? = nil
    @State var recommendedBy: String = ""
    @State var notes: String = ""
    
    @State var director: String = ""
    @State var writer: String = ""
    @State var runningTime: Int = 0
    
    @State var creator: String = ""
    @State var studio: String = ""
    @State var seasons: [Season] = [Season(name: "")]
    
    @State var artist: String = ""
    @State var album: String = ""
    @State var releaseType: ReleaseType = .single
    @State var tracklist: [Song] = []
    
    @State var author: String = ""
    @State var isbn: String = ""
    
    @State var platform: String = ""
    
    @State var achievements: [Achievement] = []
    @State var runs: [Run] = []
    
    
    @State var titleValidation: ValidationResult = .empty
    let titleValidator = NonEmptyValidator(message: "Title must be provided")
    
    @State var directorValidation: ValidationResult = .empty
    @State var writerValidation: ValidationResult = .empty
    @State var runningTimeValidation: ValidationResult = .empty
    
    let directorValidator = NonEmptyValidator(message: "Director name must be provided")
    let writerValidator = NonEmptyValidator(message: "Director name must be provided")
    let runingTimeValidator = NonEmptyValidator(message: "Director name must be provided")
    
    var body: some View {
        NavigationStack{
            Picker("Category", selection: $category) {
                Image(systemName: "popcorn.fill").tag(LogCategory.movie)
                Image(systemName: "tv.fill").tag(LogCategory.series)
                Image(systemName: "music.note").tag(LogCategory.music)
                Image(systemName: "book.fill").tag(LogCategory.book)
                Image(systemName: "gamecontroller.fill").tag(LogCategory.game)
            }
            .pickerStyle(.segmented)
            .padding([.leading, .trailing], 15)
            
            List{
                Section("General info"){
                    TextField("Title", text: $title)
                    
                    switch(category){
                    case .movie:
                        AddMovieSection(director: $director, writer: $writer, runningTime: $runningTime)
                    case .series:
                        AddSeriesSection(creator: $creator, studio: $studio)
                    case .music:
                        AddMusicSection(artist: $artist, album: $album, releaseType: $releaseType)
                    case .book:
                        AddBookSection(author: $author, isbn: $isbn)
                    case .game:
                        AddGameSection(creator: $creator, studio: $studio, platform: $platform)
                    }
                    DatePicker("Release date", selection: $releaseDate,displayedComponents: [.date])
                }
                
                if category == .music && (releaseType == .album || releaseType == .EP) {
                    AddTracklistView(songs: $tracklist)
                } else if category == .series {
                    AddSeasonView(seasons: $seasons)
                } else if category == .game {
                    AddRunSection(runs: $runs, achievementCount: achievements.count)
                    AddAchievementsSection(achievements: $achievements)
                }

                StatusPicker(status: $status, category: $category)

                Section("Extra info"){
                    if status == .completed{
                        Toggle("Same date?", isOn: $sameDate)
                        if sameDate{
                            DatePicker("Completed date",
                                       selection: $startDate,
                                       in: releaseDate...Date.now,
                                       displayedComponents: [.date])
                        } else {
                            DatePicker("Start date",
                                       selection: $startDate,
                                       in: releaseDate...Date.now,
                                       displayedComponents: [.date])
                            DatePicker("Finish date",
                                       selection: $finishDate,
                                       in: startDate...Date.now,
                                       displayedComponents: [.date])
                        }
                        if category != .series {
                            HStack{
                                Text("Rating")
                                Spacer()
                                RatingPicker(rating: $rating)
                            }
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
                addLog()
            }
            .buttonSizing(.flexible)
            .buttonStyle(.glassProminent)
            .padding()
        }
    }
    
    func addLog(){
        switch(category){
        case .movie:
            logService.addMovieLog(title: title, director: director, writer: writer, runningTime: runningTime, status: status, releaseDate: releaseDate, sameDate: sameDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, user: currentUser)
            dismiss()
        case .series:
            logService.addSeriesLog(title: title, creator: creator, studio: studio, seasons: seasons, runningTime: runningTime, status: status, releaseDate: releaseDate, sameDate: sameDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, user: currentUser)
            dismiss()
        case .music:
            logService.addMusicLog(title: title, artist: artist, album: album, releaseType: releaseType, tracklist: tracklist, status: status, releaseDate: releaseDate, sameDate: sameDate, rating: rating, recommendedBy: recommendedBy, notes: notes, user: currentUser)
            dismiss()
        case .book:
            logService.addBookLog(title: title, author: author, isbn: isbn, status: status, releaseDate: releaseDate, sameDate: sameDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, user: currentUser)
            dismiss()
        case .game:
            logService.addGameLog(title: title, creator: creator, gameStudio: studio, platform: platform, runs: runs, achievements: achievements, status: status, releaseDate: releaseDate, sameDate: sameDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, user: currentUser)
            dismiss()
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext) var modelContext
    @Previewable @State var cat: LogCategory = .movie
    let logService = LogService(modelContext: modelContext)
    AddLogSheet(logService: logService, currentUser: User(username: "", name: "", paternalSurname: "", maternalSurname: ""), category: $cat)
}
