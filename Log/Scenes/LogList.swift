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
    
    let logService: LogService
    
    @State private var showDeleteConfirmation: Bool = false
    @State private var deletingLog: Log?
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(logs){ log in
                    NavigationLink(value: log){
                        CardView(log: log)
                    }.swipeActions{
                        Button("Delete", systemImage: "trash"){
                            deletingLog = log
                            showDeleteConfirmation = true
                        }.tint(.red)
                    }
                }
            }
            .confirmationDialog(
                "You sure you want to delete \(deletingLog?.title, default: "this item")?",
                isPresented: $showDeleteConfirmation,
                titleVisibility: .visible,
                presenting: deletingLog,
            ) { log in
                Button("Delete", role: .destructive) {
                    withAnimation {
                        logService.deleteLog(log)
                        deletingLog = nil
                    }
                }
            }
            .navigationDestination(for: Log.self){ log in
                LogDetailView(log: log)
            }
        }
    }
}
