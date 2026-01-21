//
//  HMSPickerSheet.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/20.
//

import SwiftUI

struct HMSPickerSheet: View {
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var second: Int
    @Binding var milisecond: Int
    
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Picker("", selection: $hour) {
                    ForEach(0..<24, id: \.self) { Text("\($0)").font(.largeTitle) }
                }
                .pickerStyle(.wheel)
                
                Text(":")
                
                Picker("", selection: $minute) {
                    ForEach(0..<60, id: \.self) { Text("\($0)").font(.largeTitle) }
                }
                .pickerStyle(.wheel)
                
                Text(":")
                
                Picker("", selection: $second) {
                    ForEach(0..<60, id: \.self) { Text("\($0)").font(.largeTitle) }
                }
                .pickerStyle(.wheel)
                
                Text(".")
                
                Picker("", selection: $milisecond) {
                    ForEach(0..<1000, id: \.self) { Text("\($0)").font(.largeTitle) }
                }
                .pickerStyle(.wheel)
            }
        }
        .presentationDetents([.height(120)])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .glassEffect()
    }
}
