//
//  ContentView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//  Uses all bits and pieces and combines them into one main page. This is so it is easy to edit each piece and make it modular..

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        toptext_Display()
        
        Spacer()
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            YesterdayView().tabItem { Image("arrow.left.circle")}.tag(3)
            
            KanjiView().tabItem { Image("character") }.tag(2)
            
            DailyWordView().tabItem { Image("book.closed") }.tag(1)
            
            ArticleView().tabItem { Image("newspaper") }.tag(4)
            
            SettingsView().tabItem { Image("gear") }.tag(5)
        }
    }
}


#Preview {
    ContentView()
}
