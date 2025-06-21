//
//  Note.swift
//  quicknotes
//
//  Created by Thomas Béchu on 20/06/2025.
//

import Foundation
import SwiftData

@Model
class Note {
    var name: String
    var content: String
    var createdAt : Date
    
    init(name: String, content: String, createdAt: Date) {
        self.name = name
        self.content = content
        self.createdAt = createdAt
    }
}
