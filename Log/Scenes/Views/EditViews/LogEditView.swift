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
        ScrollView{
            ItemTypeView(log: log)
            TextField("Title", text: $log.title)
            switch log.category{
            case .movie:
                MovieEditView(data: $log)
            case .series:
                SeriesEditView(data: $log)
            case .music:
                MusicEditView(data: $log)
            case .book:
                BookEditView(data: $log)
            case .game:
                GameEditView(data: $log)
            }
        }
        .padding()
    }
}
