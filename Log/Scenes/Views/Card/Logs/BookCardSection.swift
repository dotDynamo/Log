//
//  BookCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct BookCardSection: View {
    let log: BookLog
    var body: some View {
        HStack{
            Text(log.author)
            if log.releaseDate != nil {
                Text(log.releaseDate!.formatted(.dateTime.year()))
                    .foregroundStyle(.gray)
            }
        }
    }
}
