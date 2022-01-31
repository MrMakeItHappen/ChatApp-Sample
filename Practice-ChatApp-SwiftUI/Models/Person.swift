//
//  Person.swift
//  Practice-ChatApp-SwiftUI
//
//  Created by Stanley Miller on 1/31/22.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imageString: String
}
