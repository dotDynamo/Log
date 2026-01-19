//
//  RatingPickerSheet.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct RatingPickerSheet: View {
    @Binding var integer: Int
    @Binding var decimal: Int
    
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Picker("", selection: $integer) {
                    ForEach(0..<11, id: \.self) { Text("\($0)").font(.largeTitle) }
                }
                .pickerStyle(.wheel)
                
                Text(".")
                
                Picker("", selection: $decimal) {
                    if integer == 10{
                        ForEach(0..<1, id: \.self) { Text("\($0)").font(.largeTitle) }
                            .task { decimal = 0 }
                    } else {
                        ForEach(0..<10, id: \.self) { Text("\($0)").font(.largeTitle) }
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .presentationDetents([.height(120)])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .glassEffect()
    }
}

