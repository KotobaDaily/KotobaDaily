//
//  homePage_View.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//

import SwiftUI

struct homePage_View: View {
    
    var user_Name = "Brandon Shippy!"
    var welcome_Text = "Welcome"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(welcome_Text + ",")
                    .font(.generalTextLarge)
                    .padding(.leading, 16.0)
                Text(user_Name)
                    .font(.nameText)
                    .padding([.leading, .bottom], 16.0)
            }
            Spacer()
        }
    }
}

#Preview {
    homePage_View()
}
