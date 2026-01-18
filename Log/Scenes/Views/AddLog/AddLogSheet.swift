//
//  AddLogSheet.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

enum LogCategory{
    case book
    case game
    case series
    case movie
    case music
}

struct AddLogSheet: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedCategory: LogCategory = .book
    
    @State var title: String = ""
    @State var releaseDate: Date = Date.now
    @State var status: Status = .completed
    @State var startDate: Date = Date.now
    @State var finishDate: Date = Date.now
    @State var rating: Double = 0.0
    @State var recommendedBy: String = ""
    @State var notes: String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Category").foregroundStyle(.gray).bold()
                Picker("Category", selection: $selectedCategory) {
                    Image(systemName: "book.fill").tag(LogCategory.book)
                    Image(systemName: "gamecontroller.fill").tag(LogCategory.game)
                    Image(systemName: "film.fill").tag(LogCategory.movie)
                    Image(systemName: "tv.fill").tag(LogCategory.series)
                    Image(systemName: "music.note").tag(LogCategory.music)
                }.pickerStyle(.segmented)
                TextField("Title", text: $title)
                    .padding(.top)
                HStack{
                    Text("Release Date")
                    DatePicker("",
                           selection: $releaseDate,
                           displayedComponents: [.date]
                       )
                }
                
                switch(selectedCategory){
                case .book:
                    Text("This is a book")
                case .game:
                    Text("This is a game")
                case .movie:
                    Text("This is a movie")
                case .series:
                    Text("This is a series")
                case .music:
                    Text("This is  music")
                }
                
                HStack{
                    Text("Status")
                    Spacer()
                    Picker("Status", selection: $status){
                        Text("Queue").tag(Status.inQueue)
                        Text("In progress").tag(Status.inProgress)
                        Text("Completed").tag(Status.completed)
                        Text("Dropped").tag(Status.dropped)
                        
                    }
                }
                switch(status){
                case .inQueue:
                    Text("")
                case .inProgress:
                    HStack{
                        Text("Start Date")
                        DatePicker("",
                               selection: $startDate,
                               displayedComponents: [.date]
                           )
                    }
                case .completed:
                    HStack{
                        Text("Start Date")
                        DatePicker("",
                               selection: $startDate,
                               displayedComponents: [.date]
                           )
                    }
                    HStack{
                        Text("Finish Date")
                        DatePicker("",
                               selection: $finishDate,
                               displayedComponents: [.date]
                           )
                    }
                    HStack{
                        Stepper("Rating", value: $rating)
                    }
                case .dropped:
                    HStack{
                        Text("Start Date")
                        DatePicker("",
                               selection: $startDate,
                               displayedComponents: [.date]
                           )
                    }
                    HStack{
                        Stepper("Rating", value: $rating)
                    }
                }
                TextField("Recommended by", text: $recommendedBy)
                Text("Notes:")
                TextField("Write your thoughts here...", text: $notes, axis: .vertical)
                HStack{
                    Spacer()
                    Button("Log It"){
                        print("Log")
                    }.buttonStyle(.glassProminent)
                        .padding()
                    Spacer()
                }
                
            Spacer()
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button(role: .cancel){ dismiss()}
                }
            }
        }
        
    }
}

#Preview {
    AddLogSheet()
}

/*
 var notes: String?
 */
