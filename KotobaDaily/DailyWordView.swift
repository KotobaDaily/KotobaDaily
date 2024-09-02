//
//  DailyWordView.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/24..
//

import SwiftUI
import GoogleSignIn

struct DailyWordView: View {
    @StateObject private var pullWords = WOTDViewModel()
    @State private var isFavorited: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text("Word of the Day")
                        .font(.custom("wotdText", size: 18))
                        .padding(.vertical, 6.0)
                        .foregroundColor(Color("HeaderColor"))
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    Spacer()
                    Button {
                        toggleFavorite()
                    } label: {
                        Image(systemName: isFavorited ? "star.fill" : "star")
                            .foregroundColor(isFavorited ? .yellow : .gray)
                    }
                    .padding(.trailing, 16.0)
                }
                .frame(maxWidth: .infinity)
            }
            VStack {
                Text(pullWords.wordoftheday + " " + pullWords.partofspeech)
                    .font(.wotdWordText)
                    .padding(.horizontal, 16.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(pullWords.furigana)
                    .font(.furigana)
                    .padding(.horizontal, 16.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(pullWords.definition)
                    .font(.generalTextSmall)
                    .padding([.leading, .bottom, .trailing], 16.0)
                    .padding(.top, 4.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(pullWords.example)
                    .font(.generalTextSmall)
                    .padding(.all, 16.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                // If you need a line above the nav bar.. here is the spot
            }
        }
                .onAppear{
                    pullWords.fetchWords()
                    isInFav()
                }
    }
    
// Toggle favorite status
    private func toggleFavorite() {
        if(GIDSignIn.sharedInstance.currentUser == nil) { return }
        isInFav()
        if isFavorited {
            removeFromFavorites()
        } else {
            addToFavorites()
        }
    }
    
    private func isInFav() {
        if(GIDSignIn.sharedInstance.currentUser == nil) { return }
        guard let url = URL(string: "http://localhost:8000/favorites?userID=\(GIDSignIn.sharedInstance.currentUser?.userID ?? "")") else {
            print("Invalid URL")
            return
        }
    
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Use GET method as we are fetching data

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error checking favorite status: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let favorites = try decoder.decode([WOTD].self, from: data) // Decode the response as an array of WOTD
                print(favorites)
                print(GIDSignIn.sharedInstance.currentUser?.userID)
                // Check if the word of the day is in the favorites
                DispatchQueue.main.async {
                    self.isFavorited = favorites.contains(where: { $0.Word == pullWords.wordoftheday })
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }.resume()
    }
    
    // Check if the word is already favorited
    private func removeFromFavorites() {
        guard let url = URL(string: "http://localhost:8000/removeFavorite") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Keep POST method as your server expects it
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["userID": GIDSignIn.sharedInstance.currentUser?.userID, "Word": pullWords.wordoftheday]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error removing favorite: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    isFavorited = false // Update the state to reflect that the word is no longer favorited
                }
            } else {
                print("Failed to remove favorite. Status code: \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
            }
        }.resume()
        isFavorited = false;
    }
    
    // Add the word to the favorites
    private func addToFavorites() {
            guard let url = URL(string: "http://localhost:8000/addFavorite") else {
                print("Invalid URL")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let body: [String: Any] = ["userID": GIDSignIn.sharedInstance.currentUser?.userID, "Word": pullWords.wordoftheday]
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error adding favorite: \(error)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                    DispatchQueue.main.async {
                        isFavorited = true
                    }
                }
            }.resume()
        }
 
}


#Preview {
    DailyWordView()
}
