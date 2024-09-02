//
//  FavoriteView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/08/11.
//

import SwiftUI
import GoogleSignIn

struct FavoriteView: View {
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        VStack {
            if GIDSignIn.sharedInstance.currentUser == nil {
                Text("You need to be logged in to use favorites")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else if viewModel.favorites.isEmpty  {
                Text("No favorites found")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                List(viewModel.favorites, id: \.Word) { favorite in
                    VStack(alignment: .leading) {
                        Text(favorite.Word)
                            .font(.wotdWordText) 
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
            viewModel.fetchFavorites()
        }
        .navigationTitle("Favorite Words")
    }
}

#Preview {
    FavoriteView()
}
