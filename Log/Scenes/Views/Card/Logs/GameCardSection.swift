//
//  GameCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct GameCardSection: View {
    let log: Log
    var body: some View {
        HStack{
            Text(log.game!.gameStudio)
            if log.releaseDate != nil {
                Text(TimeUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            }
            Text(log.game!.platform).font(.caption)
        }
    }
}
