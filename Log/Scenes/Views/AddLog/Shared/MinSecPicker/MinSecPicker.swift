//
//  MinSecPicker.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct MinSecPicker: View {
    @State var minute: Int = 0
    @State var second: Int = 0
    @State var isPresented: Bool = false
    
    @Binding var duration: Int
    
    var body: some View {
        Text(String(format: "%02d:%02d", minute, second))
            .frame(width: 50)
            .padding(8)
            .onTapGesture { isPresented.toggle()  }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            .sheet(isPresented: $isPresented) {
                MSPickerSheet(minute: $minute, second: $second)
            }
            .onChange(of: isPresented) {
                duration = minute * 60 + second
            }
    }
}

#Preview {
    @Previewable @State var duration: Int = 0
    MinSecPicker(duration: $duration)
}
