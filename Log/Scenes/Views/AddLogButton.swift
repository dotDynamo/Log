//
//  AddLogButton.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import SwiftUI

struct AddLogButton: View {
    var action: () -> Void
    var plusColor: Color = .accentColor
    var buttonColor: Color = .clear
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button(action: action){
                    Image(systemName: "plus.circle.fill")
                        .symbolRenderingMode(.palette)
                        .font(.system(size: 56))
                        .foregroundStyle(plusColor, buttonColor)
                        .glassEffect()
                        
                }
                .padding()
            }
        }
        
    }
    
}

#Preview {
    AddLogButton(action: { print("Button pressed") })
}
