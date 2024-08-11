//
//  GameView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/07/31.
//

import SwiftUI

struct GameView: View {
    @StateObject var guess = GuessModel()
    var body: some View {
        let size = 50.0;
        let boxPaddingH = 5.0;
        let boxPaddingV = 7.0;
        let boxColor = Color("LineColor")
        var guesses: [[Character?]] = Array(
            repeating: Array(repeating: nil, count: 5),
            count: 6
        )
        VStack {
            HStack {
                Rectangle()
                    .fill(boxColor)
                    .frame(width: size, height: size, alignment: .center)
                    .padding(.horizontal, boxPaddingH)
                    .padding(.vertical, boxPaddingV)
                Rectangle()
                    .fill(boxColor)
                    .frame(width: size, height: size, alignment: .center)
                    .padding(.horizontal, boxPaddingH)
                    .padding(.vertical, boxPaddingV)
                Rectangle()
                    .fill(boxColor)
                    .frame(width: size, height: size, alignment: .center)
                    .padding(.horizontal, boxPaddingH)
                    .padding(.vertical, boxPaddingV)
                Rectangle()
                    .fill(boxColor)
                    .frame(width: size, height: size, alignment: .center)
                    .padding(.horizontal, boxPaddingH)
                    .padding(.vertical, boxPaddingV)
                Rectangle()
                    .fill(boxColor)
                    .frame(width: size, height: size, alignment: .center)
                    .padding(.horizontal, boxPaddingH)
                    .padding(.vertical, boxPaddingV)
            }
            ZStack {
                Rectangle()
                    .fill(boxColor)
                    .frame(width: 60, height: 40, alignment: .center)
                    .padding(.horizontal, boxPaddingH)
                    .padding(.vertical, boxPaddingV)
                TextField(
                    "Type",
                    text: $guess.guess
                )
                .frame(width: size, height: size, alignment: .center)
            }
        }
        .environmentObject(guess)
    }
}

#Preview {
    GameView()
}
