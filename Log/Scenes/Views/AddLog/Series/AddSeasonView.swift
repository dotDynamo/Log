//
//  AddSeasonView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/19.
//

import SwiftUI

struct AddSeasonView: View {
    @Binding var seasons: [Season]
    @State var isExpanded: Bool = true
    
    @State private var selectedSeason: Season?
    
    var body: some View {
        Section("Seasons", isExpanded: $isExpanded){
            ForEach($seasons) { $season in
                NavigationLink(destination: AddEpisodesView(season: $season)){
                    TextField("Season \((seasons.firstIndex(of: season) ?? 0) + 1)",
                        text: $season.name)
                    .frame(maxWidth: 225)
                }
            }
            .onDelete { indexSet in
                seasons.remove(atOffsets: indexSet)
            }
            Button("Add Season", systemImage: "plus", action: addSeason)
        }
    }
    
    func addSeason(){
        let newSeason = Season(name: "")
        seasons.append(newSeason)
    }
}

#Preview {
    @Previewable @State var seasons: [Season] = []
    NavigationStack{
        List{
            AddSeasonView(seasons: $seasons)
        }
        .listStyle(.sidebar)
    }
}
