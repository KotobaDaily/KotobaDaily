//
//  APITests.swift
//  KotobaDaily
//
//  Created by Brandon Shippy on 2024/06/25.
//  Just for my own understanding I am explaining what exactly is happening here. We have defined a struct that is able to hold the information given in the JSON that is being held at that local port. We then create an array of that struct so we can hold all the data in that JSON. We are gonna ignore the fundamental bits like cancellable, but yeah. We then define our funtion fetchWords(). In this we define our URL, the one where we obtain the JSON from. We do all that fancy stuff, but in the end we either spit out an error, or receive the goods. In that receiveValue we take it in the value of "response", then input the value of response into our Array of structs, "words". In another file we then can use this class and get information and display it in this way.

// Of course we can change the struct and define many different classes, but yeah.......

import SwiftUI
import Combine

class WOTDViewModel: ObservableObject {
    @Published var words: [WOTD] = [] // Allows updates to be made and automatically trigger them uses our struct Word
    private var cancellable: AnyCancellable? // Allows the network request to be cancelled
    
    @Published var wordoftheday = "寝不足" // Define variables to hold the fetched information from. @Published makes it update.
    @Published var definition = "lack of sleep; insufficient sleep"
    @Published var example = "寝不足の影響がではじめた"
    @Published var furigana = "ねぶそく"
    
    private var hasFetched = false // Makes it so it only checks ONCE. Bandaid fix for now, requires user to restart
    
    func fetchWords() { // function for getting information from the URL
        guard !hasFetched else { return }
                hasFetched = true
        
        guard let url = URL(string: "http://localhost:8000/words/") else { // let keyword is a const
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url) // since we define it as cancellable we can cancel if needed
            .map { $0.data } // Array of JSON Data
            .decode(type: [WOTD].self, decoder: JSONDecoder()) // WOTD being our struct
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching words: \(error)")
                }
            }, receiveValue: { response in // Filling in our struct
                self.words = response
                if let firstWord = response.first { // Get the whole struct. Then assign each part of the struc to our @Publisher varaibles, which will update the user.
                    self.wordoftheday = firstWord.Word
                    self.definition = firstWord.Definition
                    self.example = firstWord.Example
                    self.furigana = firstWord.Furigana
                }
                
            })
    }
    
    func refreshWords() { // USE THIS WHEN WANTING TO LET THEM MAKE ANOTHER API CALL
            hasFetched = false
            fetchWords()
        }
    
    deinit {
        cancellable?.cancel() // Prevents memory leak
    }
}

class yesterdayWOTDViewModel: ObservableObject {
    @Published var words: [WOTD] = [] // Allows updates to be made and automatically trigger them uses our struct Word
    private var cancellable: AnyCancellable? // Allows the network request to be cancelled
    
    @Published var wordoftheday = "寝不足" // Define variables to hold the fetched information from. @Published makes it update.
    @Published var definition = "lack of sleep; insufficient sleep"
    @Published var example = "寝不足の影響がではじめた。"
    @Published var furigana = "ねぶそく"
    
    private var hasFetched = false // Makes it so it only checks ONCE. Bandaid fix for now, requires user to restart
    
    func fetchWords() { // function for getting information from the URL
        guard !hasFetched else { return }
                hasFetched = true
        
        guard let url = URL(string: "http://localhost:8000/yesterday/") else { // let keyword is a const
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url) // since we define it as cancellable we can cancel if needed
            .map { $0.data } // Array of JSON Data
            .decode(type: [WOTD].self, decoder: JSONDecoder()) // WOTD being our struct
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching words: \(error)")
                }
            }, receiveValue: { response in // Filling in our struct
                self.words = response
                if let firstWord = response.first { // Get the whole struct. Then assign each part of the struc to our @Publisher varaibles, which will update the user.
                    self.wordoftheday = firstWord.Word
                    self.definition = firstWord.Definition
                    self.example = firstWord.Example
                    self.furigana = firstWord.Furigana
                }
                
            })
    }
    
    func refreshWords() { // USE THIS WHEN WANTING TO LET THEM MAKE ANOTHER API CALL
            hasFetched = false
            fetchWords()
        }
    
    deinit {
        cancellable?.cancel() // Prevents memory leak
    }
}

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [WOTD] = [] // Use WOTD instead of FavoritesList
    private var cancellable: AnyCancellable?

    func fetchFavorites(for userID: String) {
        guard let url = URL(string: "http://localhost:8000/favorites/?userID=\(userID)") else {
            print("Invalid URL for fetching favorites")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [WOTD].self, decoder: JSONDecoder()) // Decode as WOTD
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching favorites: \(error)")
                }
            }, receiveValue: { response in
                self.favorites = response
            })
    }

    deinit {
        cancellable?.cancel()
    }
}
