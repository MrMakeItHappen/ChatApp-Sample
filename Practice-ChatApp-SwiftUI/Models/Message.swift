//
//  Message.swift
//  Practice-ChatApp-SwiftUI
//
//  Created by Stanley Miller on 1/31/22.
//

import Foundation

struct Message: Identifiable {
    
    enum MessageType {
        case sent
        case received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
    
}
