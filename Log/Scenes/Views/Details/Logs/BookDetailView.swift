//
//  BookDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct BookDetailView: View {
    let log: BookLog
    var body: some View {
        Text("Author").font(.headline).foregroundStyle(.gray)
        Text(log.author)
        if log.isbn != nil{
            Text("ISBN").font(.headline).foregroundStyle(.gray)
            Text(log.isbn!)
        }
    }
}
