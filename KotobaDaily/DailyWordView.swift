//
//  DailyWordView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/24..
//

import SwiftUI

struct DailyWordView: View {
    @StateObject private var pullWords = WOTDViewModel()
    
    var body: some View {
        VStack {
            Text(pullWords.wordoftheday)
                .font(.wotdText)
                .padding(.horizontal, 16.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("("+pullWords.furigana+")")
                .font(.furigana)
                .padding(.horizontal, 16.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Definition: " + pullWords.definition)
                .font(.generalTextSmall)
                .padding([.leading, .bottom, .trailing], 16.0)
                .padding(.top, 4.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Example: " + pullWords.example)
                .font(.generalTextSmall)
                .padding(.all, 16.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            // If you need a line above the nav bar.. here is the spot
        }
        
                .onAppear{
                    pullWords.fetchWords()
                }
    }
}

#Preview {
    DailyWordView()
}
