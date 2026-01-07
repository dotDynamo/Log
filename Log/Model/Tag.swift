//
//  Tag.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import Foundation
import SwiftData

@Model
class Tag{
    @Attribute(.unique) var id: UUID
    var name: String
    @Relationship var logs: [Log]
    
    init(id: UUID = UUID(), name: String, logs: [Log]) {
        self.id = id
        self.name = name
        self.logs = logs
    }
}
