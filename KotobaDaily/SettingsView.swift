//
//  SettingsView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var settingOptions = SettingOptions()
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Display"),
                        footer: Text("Toggles dark mode on and off")) {
                            
                    Toggle("Dark mode", isOn: settingOptions.$dark)
                }
                Section(header: Text("Account")) {
                        GoogleSignInButtonView()
                }
            }
            //.navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
