//
//  navbar_View.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//  This file details the top navigation bar, of which consists-- Hamburger and Profile button. As thus contains the button functionality of each.

import SwiftUI

struct navbar_View: View {
    
    func menuButtonPress() { //Functionality for Hamburger Menu
        print("Menu Pressed")
    }
    func profileButtonPress() { //Functionality for Profile Button
        print("Profile Pressed")
    }
    
    var body: some View {
        HStack {
            Button(action:{
                menuButtonPress()
            }) {
                Image("ham-menu")
                    .padding(.leading, 16.0)
            }
            Spacer()
            Button(action:{
                profileButtonPress()
            }) {
                Image("profile-settings")
                    .padding(.trailing, 16.0)
            }
        }
    }
}

#Preview {
    navbar_View()
}
