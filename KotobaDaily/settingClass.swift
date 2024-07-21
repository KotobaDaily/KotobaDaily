//
//  settingClass.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/07/21.
//

import Foundation
import SwiftUI

class SettingOptions: ObservableObject {
    @AppStorage("dark") var dark = false // Store the value and save setting
}
