//
//  CommonCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import SwiftUI

struct CommonCardSection: View {
    let log: Log
    @State var statusText: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(statusText)
                .font(.caption)
            Text(log.title)
                .font(.title2)
        }
        .onAppear(){
            statusText = LogUtils.statusToText(log: log)
        }
    }
}
