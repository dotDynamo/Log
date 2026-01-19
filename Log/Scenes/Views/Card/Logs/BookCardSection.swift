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
                Text(TimeUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            }
        }
    }
}
