//
//  RatingView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import SwiftUI

enum Size {
    case small
    case medium
    case large
}

enum RatingStyle {
    case capsule
    case round
}

struct RatingView: View {
    let rating: Double?
    var size: Size = .small
    var style: RatingStyle = .capsule
    
    @State var ratingText: String = ""
    @State var ratingColor: Color = .gray
    
    @State var ratingFont: Font = .footnote
    @State var scale: CGFloat = 1
    
    var body: some View {
        ZStack{
            if style == .capsule {
                RoundedRectangle(cornerRadius: 10 * scale)
                    .fill(ratingColor)
                    .frame(width: 50 * scale, height: 25 * scale)
            } else {
                Circle().frame(width: 30 * scale).foregroundStyle(ratingColor)
            }
            Text(ratingText)
                .foregroundStyle(.white)
                .font(ratingFont)
        }
        .onAppear(){
            ratingText = LogUtils.ratingToText(rating: rating, style: style)
            ratingColor = ratingToColor()
            setSize()
        }
    }
    
    func ratingToColor() -> Color{
        if rating != nil{
            if rating! <= 3 {
                return .horribleScore
            } else if rating! <= 5 {
                return .badScore
            } else if rating! <= 6.9 {
                return .averageScore
            } else if rating! <= 7.9 {
                return .goodScore
            } else if rating! <= 9.4 {
                return .excellentScore
            } else {
                return .perfectScore
            }
        }
        return .gray
    }
    
    func setSize(){
        switch(size){
        case .small:
            ratingFont = .footnote
            scale = 1
        case .medium:
            ratingFont = .body
            scale = 1.2
        case .large:
            ratingFont = .title
            scale = 2
        }
    }
}

#Preview {
    RatingView(rating: 0, style: .round)
    RatingView(rating: 4, size: .medium, style: .round)
    RatingView(rating: 5.6, size: .large, style: .round)
    RatingView(rating: 7.5)
    RatingView(rating: 9.4, size: .medium)
    RatingView(rating: 10, size: .large)
}
