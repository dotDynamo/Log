//
//  Song.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/12.
//

import Foundation
import SwiftData

@Model
class Song{
    @Attribute(.unique) var id: UUID
    var name: String
    var duration: Int
    var isSaved: Bool = false
    @Relationship var album: MusicLog
    
    init(id: UUID = UUID(), name: String, duration: Int, album: MusicLog) {
        self.id = id
        self.name = name
        self.album = album
        self.duration = duration
    }
}
