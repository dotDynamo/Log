//
//  RatingView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import SwiftUI

struct RatingView: View {
    let rating: Double?
    @State var ratingText: String = ""
    @State var ratingColor: Color = .gray
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(ratingColor)
                .frame(width: 50, height: 25)
            Text(ratingText).foregroundStyle(.white)
                .font(.footnote)
        }
        .onAppear(){
            ratingText = LogUtils.ratingToText(rating: rating)
            if rating != nil{
                ratingColor = ratingToColor(rating!)
            }
            
        }
    }
    
    func ratingToColor(_ rating: Double) -> Color{
        if rating <= 3 {
            return .indigo
        } else if rating <= 5 {
            return .red
        } else if rating <= 6.9 {
            return .orange
        } else if rating <= 7.9 {
            return .yellow
        } else if rating <= 9.4 {
            return .green
        } else {
            return Color(.darkGreen)
        }
    }
}

#Preview {
    RatingView(rating: 10)
}
