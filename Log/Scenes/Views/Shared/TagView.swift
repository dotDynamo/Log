//
//  TagView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct TagView: View {
    let tags: [Tag]
    var body: some View {
        HStack{
            ForEach(tags){ tag in
                Text(tag.name)
                    .font(.caption2)
            }
        }
    }
}

#Preview {
    let tags: [Tag] = [Tag(name: "Fiction"), Tag(name: "Other")]
    TagView(tags: tags)
}
