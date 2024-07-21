//
//  ContentView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//  Uses all bits and pieces and combines them into one main page. This is so it is easy to edit each piece and make it modular..

import SwiftUI

struct ContentView: View {
    @StateObject var settings = SettingOptions() // Can just read classes across files ig, this is in SettingsView.swift
    @State private var selectedTab = 1 // State property to manage the selected tab
    var body: some View {
            VStack {
                toptext_Display()
                
                Rectangle()
                    .fill(Color("LineColor"))
                    .frame(width: 450, height: 3, alignment: .center)
                
                Spacer()
                
                TabView(selection: $selectedTab) { // Bind the selection to the state property
                    YesterdayView()
                        .tabItem { Image(systemName: "arrow.left.circle") }
                        .tag(2)
                    
                    DailyWordView()
                        .tabItem { Image(systemName: "book.closed") }
                        .tag(1)
                    
                    ArticleView()
                        .tabItem { Image(systemName: "newspaper") }
                        .tag(3)
                    
                    SettingsView()
                        .tabItem { Image(systemName: "gear") }
                        .tag(4)
                }
                .preferredColorScheme(settings.dark ? .dark : .light)
            }
            .environmentObject(settings) // Pass the settings object to the environment so our TabView can know what page to be on
        }
}


#Preview {
    ContentView()
}
