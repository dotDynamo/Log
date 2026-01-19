//
//  MSPickerPopup.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct MSPickerSheet: View {
    @Binding var minute: Int
    @Binding var second: Int
    
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Picker("", selection: $minute) {
                    ForEach(0..<60, id: \.self) { Text("\($0)").font(.largeTitle) }
                }
                .pickerStyle(.wheel)
                
                Text(":")
                
                Picker("", selection: $second) {
                    ForEach(0..<60, id: \.self) { Text("\($0)").font(.largeTitle) }
                }
                .pickerStyle(.wheel)
            }
        }
        .presentationDetents([.height(120)])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .glassEffect()
    }
}
