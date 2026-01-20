//
//  AddBookSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct AddBookSection: View {
    @Binding var author: String
    @Binding var isbn: String
    
    var body: some View {
        TextField("Author", text: $author)
        TextField("ISBN", text: $isbn)
    }
}
