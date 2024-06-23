//
//  ContentView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//  Uses all bits and pieces and combines them into one main page. This is so it is easy to edit each piece and make it modular.

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollViewReader { proxy in

                navbar_View()
            
                homePage_View()
                
                buttons_View()
                Spacer()
        }
    }
}


#Preview {
    ContentView()
}
