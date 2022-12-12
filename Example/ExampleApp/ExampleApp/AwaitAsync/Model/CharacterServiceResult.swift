//
//  CharacterServiceResult.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/06/25.
//

import Foundation

struct CharacterServiceResult: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
}
