//
//  BookDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct BookDetailView: View {
    let log: Log
    var body: some View {
        Text("Author").font(.headline).foregroundStyle(.gray)
        Text(log.book!.author)
        if log.book!.isbn != nil{
            Text("ISBN").font(.headline).foregroundStyle(.gray)
            Text(log.book!.isbn!)
        }
    }
}
