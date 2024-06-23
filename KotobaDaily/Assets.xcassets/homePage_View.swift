//
//  homePage_View.swift
//  wip_Japanese
//
//  Created by Brandon Shippy on 2024/06/19.
//

import SwiftUI
import SwiftData

struct homePage_View: View {
    @State var user_name = "Brandon Shippy"
    var body: some View {
        
            HStack {
                VStack(alignment: .leading) {
                    Text("Welcome,")
                        .padding(.horizontal, 16.0)
                    Text(user_name)
                        .padding([.leading, .bottom, .trailing], 16.0)
                }
                Spacer()
            }
            Spacer()
        }

    }


        
#Preview {
    homePage_View()
}
