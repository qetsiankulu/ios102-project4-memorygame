//
//  CardGrid.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/24/24.
//

import SwiftUI

struct CardGrid: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    // 3-column grid
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10, content: {
                
                // Use a ForEach loop to iterate over the cards in the GameViewModel
                // Create an array of tuples where each tuple contains an index and a card from GameViewModel.cards. Each element in the array is placed 
                
                ForEach(Array(gameViewModel.cards.enumerated()), id: \.offset) { index, card in
                    CardView(card: .constant(card), index: index)
                }
            })
            .padding()
        }
        .onAppear {
            // set the default amount to six cards (3 pairs)
            gameViewModel.startGame(cardCount: .six)
        }
        
    }
}

#Preview {
    CardGrid()
        .environmentObject(GameViewModel())
}
