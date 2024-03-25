//
//  GameViewModel.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/24/24.
//

import Foundation

@MainActor
class GameViewModel: ObservableObject {
    
    @Published var cards: [Card] = []
    var cardCount: CardCount = .six

    var selectedCards: [Card] = [] {
        didSet {                                                          // <--- when the selectedCards array is modified, the didSet observer is triggered
            if selectedCards.count == 2 {                                 // <--- didSet checks if two cards have been selected
                
                if selectedCards[0].emoji == selectedCards[1].emoji {                  // <--- check if the two selected cards have the same symbol
                    for i in 0..<cards.count {                                         // <--- Loop through the cards array and set the isMatched property to true
                        if cards[i].emoji == selectedCards[0].emoji {                  // <--- for all the cards that have the same symbol as the selected cards
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {    // <--- after a 0.5 second delay to make them disappear
                                self.cards[i].isMatched = true
                            }
                        }
                    }
                    
                    clearSelectedCards()
                } else {
                    // the cards do not match so flip them back
                    for i in 0..<cards.count {                                                                      // <-- Loop through the cards array and set the
                        if cards[i].emoji == selectedCards[0].emoji || cards[i].emoji == selectedCards[1].emoji {   // <-- isFaceUp property of the non-matching
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {                                 // <-- cards to false after a 0.5 second delay
                                self.cards[i].isFaceUp = false
                                
                            }
                        }
                    }
                    
                    clearSelectedCards()
                }
            }
        }
    }
                    

    // clear the selected cards afer they've been matched or flipped back down
    private func clearSelectedCards() {
        selectedCards.removeAll()
    }
    
    private var availableCards: [Card] = [
        Card(emoji: "🌍"),
        Card(emoji: "🚀"),
        Card(emoji: "🌈"),
        Card(emoji: "🌍"),
        Card(emoji: "🔥"),
        Card(emoji: "🌟"),
        Card(emoji: "🍿"),
        Card(emoji: "🎃"),
        Card(emoji: "🏀"),
        Card(emoji: "✈️")
    ]
    
    // starts the game based on the number of cards
    func startGame(cardCount: CardCount) {
        self.cardCount = cardCount
        cards.removeAll()
        var tempCards: [Card] = []
        
        for i in 0...(cardCount.rawValue / 2) - 1 {
            let card1 = Card(emoji: availableCards[i].emoji)
            let card2 = Card(emoji: availableCards[i].emoji)
            
            tempCards.append(card1)
            tempCards.append(card2)
        }
        cards = tempCards.shuffled()
    }
    

}

enum CardCount: Int, CaseIterable {
    case six = 6
    case twelve = 12
    case twenty = 20
}
