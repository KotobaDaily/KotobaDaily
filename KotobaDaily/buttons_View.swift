//
//  buttons_View.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/23.
//

import SwiftUI

struct buttons_View: View {
    
    @State private var wotdPath = NavigationPath()

    func kanjiWordButtonPress() {
        print("Kanji Pressed")
    }
    func articleButtonPress() {
        print("Article Pressed")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: DailyWordView()) {
                    Text("Word of The Day")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 330.0, height: 100.0)
                        .background(Color("MainColor"))
                        .cornerRadius(8)
                }
                .padding([.leading, .bottom, .trailing], 22)
                HStack {
                    Spacer()
                    Button(action: kanjiWordButtonPress) {
                        Text("Kanji")
                            .font(.generalTextLarge)
                            .foregroundColor(.white)
                            .frame(width: 161.0, height: 100.0)
                            .background(Color("MainColor"))
                            .cornerRadius(8)
                    }
                    Button(action: articleButtonPress) {
                        Text("Article")
                            .font(.generalTextLarge)
                            .foregroundColor(.white)
                            .frame(width: 161.0, height: 100.0)
                            .background(Color("MainColor"))
                            .cornerRadius(8)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    buttons_View()
}
