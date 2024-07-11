//
//  APIStructs.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/25.
//

import Foundation

struct WOTD: Codable {
    let Word: String
    let Example: String
    let Definition: String
    let Furigana: String
}
