//
//  FavoriteView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/08/11.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        VStack {
            if currentUserID == "" {
                Text("You need to be logged in to use favorites")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else if viewModel.favorites.isEmpty {
                Text("No favorites found")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                List(viewModel.favorites, id: \.Word) { favorite in
                    VStack(alignment: .leading) {
                        Text(favorite.Word)
                            .font(.wotdWordText) // Assuming this is a custom font defined in your project
                        Text(favorite.Furigana)
                            .font(.furigana)
                        Text(favorite.Definition)
                            .font(.generalTextSmall)
                        Text(favorite.Example)
                            .font(.generalTextSmall)
                    }
                    .padding(.horizontal, 16.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .onAppear {
            print(currentUserID)
            if currentUserID == "" {
                viewModel.fetchFavorites(for: currentUserID)
            }
        }
        .navigationTitle("Favorite Words")
    }
}

#Preview {
    FavoriteView()
}
