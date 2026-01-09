//
//  GameCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct GameCardSection: View {
    let log: GameLog
    var body: some View {
        HStack{
            Text(log.gameStudio)
            Text(log.platform)
            if log.releaseDate != nil {
                Text(LogUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            }
        }
    }
}
