//
//  TagView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

enum TagStyle {
    case simple
    case complete
}

struct TagView: View {
    let tags: [Tag]
    var style: TagStyle = .simple
    var body: some View {
        switch(style){
        case .simple:
            TagRows(tags: tags)
        case .complete:
            VStack(alignment: .leading){
                Text("Tags:").font(.headline).foregroundStyle(.gray)
                TagRows(tags: tags)
            }
        }
    }
    
    func TagRows(tags: [Tag]) -> some View{
        HStack {
            ForEach(tags){ tag in
                Text(tag.name)
                    .font(style == .simple ? .caption2 : .body)
            }
        }
    }
}



#Preview {
    let tags: [Tag] = [Tag(name: "Fiction"), Tag(name: "Other")]
    TagView(tags: tags, style: .complete)
    TagView(tags: tags)
}
