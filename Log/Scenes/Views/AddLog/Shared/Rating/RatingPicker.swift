//
//  RatingPicker.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct RatingPicker: View {
    @State var integer: Int = 0
    @State var decimal: Int = 0
    @State var isPresented: Bool = false
    
    @Binding var rating: Double?

    var body: some View {
        Text( rating != nil ? String(format: decimal == 0 ? "%d" : "%2d.%d", integer, decimal) : "-")
            .frame(width: 50)
            .padding(8)
            .onTapGesture { isPresented.toggle()  }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            .sheet(isPresented: $isPresented) {
                RatingPickerSheet(integer: $integer, decimal: $decimal)
            }
            .onChange(of: isPresented) {
                rating = Double(integer)
                rating! += Double(decimal) * 0.1
            }
    }
}

#Preview {
    @Previewable @State var rating: Double? = 0.0
    @Previewable @State var rating2: Double? = nil
    RatingPicker(rating: $rating)
    RatingPicker(rating: $rating2)
}
