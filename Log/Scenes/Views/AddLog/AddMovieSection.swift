//
//  AddMovieSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct AddMovieSection: View {
    @Binding var director: String
    @Binding var writer: String
    @Binding var runningTime: Int
    
    @State var runningTimeText: String = ""
    var body: some View {
        TextField("Director", text: $director)
        TextField("Writer", text: $writer)
        HStack{
            Text("Running time")
            TextField("0", text: $runningTimeText){
                if !runningTimeText.isEmpty{
                    runningTime = Int(runningTimeText)!
                }
            }
            .keyboardType(.numberPad)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.trailing)
            Text("minutes")
        }
    }
}
