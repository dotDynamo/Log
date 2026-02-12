//
//  LogEditView.swift
//  Log
//
//  Created by Diego Herrera on 2026/02/10.
//

import SwiftUI

struct LogEditView: View {
    
    @Binding var log: Log
    
    var body: some View {
        Form{
            Section("General information"){
                TextField("Title", text: $log.title)
                switch log.category{
                case .movie:
                    MovieEditView(
                        data: Binding(
                            get: { log.movie! },
                            set: { log.movie = $0 }
                        )
                    )
                case .series:
                    SeriesEditView(
                        data: Binding(
                            get: { log.series! },
                            set: { log.series = $0 }
                        )
                    )
                case .music:
                    MusicEditView(
                        data: Binding(
                            get: { log.music! },
                            set: { log.music = $0 }
                        )
                    )
                case .book:
                    BookEditView(
                        data: Binding(
                            get: { log.book! },
                            set: { log.book = $0 }
                        )
                    )
                case .game:
                    GameEditView(
                        data: Binding(
                            get: { log.game! },
                            set: { log.game = $0 }
                        )
                    )
                }
                DatePicker("Completed date",
                           selection: $log.releaseDate,
                           in: Date.distantPast...Date.now,
                           displayedComponents: [.date])
                
                StatusPicker(status: $log.status, category: $log.category, showTitle: false)
            }
            Section("Extra"){
                
            }
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                ItemTypeView(log: log)
            }
        }
    }
}
