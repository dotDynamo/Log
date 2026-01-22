//
//  LogList.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI
import SwiftData

struct LogList: View {
    @Query(sort: \Log.title) private var logs: [Log]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack{
            Text("log count: \(logs.count)")
            List{
                ForEach(logs){ log in
                    NavigationLink(value: log){
                        CardView(log: log)
                    }
                }
            }.navigationDestination(for: Log.self){ log in
                LogDetailView(log: log)
            }
        }
    }
}
