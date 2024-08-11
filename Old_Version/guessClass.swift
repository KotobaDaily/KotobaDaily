//
//  guessClass.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/07/31.
//

import Foundation
import SwiftUI

class GuessModel: ObservableObject {
    @Published var guess: String = "hello"
}
