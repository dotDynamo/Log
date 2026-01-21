//
//  RunTimePicker.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/20.
//

import SwiftUI

struct RunTimePicker: View {
    @State var hour: Int = 0
    @State var minute: Int = 0
    @State var second: Int = 0
    @State var milisecond: Int = 0
    @State var isPresented: Bool = false
    
    @Binding var duration: Double
    
    var format: String {
        if milisecond == 0 {
            return "%d:%02d:%02d.%d"
        }
        return "%d:%02d:%02d.%03d"
    }
    
    var width: CGFloat {
        if hour < 10 && milisecond == 0 {
            return 80
        }
        else if milisecond == 0 {
            return 90
        }
        return 110
    }
    
    var hourSeconds: Double { return Double(hour * 3600)}
    var minuteSeconds: Double { return Double(minute * 60)}
    var miliseconds: Double { return Double(milisecond) * 0.001}

    
    var body: some View {
        Text(String(format: format , hour, minute, second, milisecond))
            .frame(width: width)
            .padding(8)
            .onTapGesture { isPresented.toggle()  }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            .sheet(isPresented: $isPresented) {
                HMSPickerSheet(hour: $hour, minute: $minute, second: $second, milisecond: $milisecond)
            }
            .onChange(of: isPresented) {
                duration = hourSeconds + minuteSeconds + Double(second) + miliseconds
            }
    }
}

#Preview {
    @Previewable @State var duration: Double = 0
    RunTimePicker(duration: $duration)
    Text("\(duration)")
}
