//
//  KanjiView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/24.
//

import SwiftUI

var kanji = "寝"
var kunReadings = ["ね", "い", "みたまや", "や"] // Once backend linked with API, maybe we can create a blank array then reading in all that days readings
var onReadings = ["シン"]
var exampleWord = "寝る"

struct KanjiView: View {
    var body: some View {
        VStack {
            Text(kanji)
                .font(.kanjiText)
                .padding(.top, 45.0)
                .padding([.leading, .bottom, .trailing], 16.0)
            
                Text("Kun Readings:")
                    .font(.generalTextLarge)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10.0)
            HStack {
                ForEach(kunReadings, id: \.self) { reading in
                    Text(reading)
                        .font(.generalTextSmall)
                        .padding(.leading, 16.0)
                }
            }
            
                Text("On Readings:")
                    .font(.generalTextLarge)
                    .padding(.top, 10.0)
            HStack {
                ForEach(onReadings, id: \.self) { reading in
                    Text(reading)
                        .font(.generalTextSmall)
                        .padding(.leading, 16.0)
                }
            }
            Text("Example Word:")
                .font(.generalTextLarge)
                .padding(.top, 10.0)
            Text(exampleWord)
                .font(.generalTextSmall)
                .padding(.leading, 16.0)
            Spacer()
        }
    }
}

#Preview {
    KanjiView()
}
