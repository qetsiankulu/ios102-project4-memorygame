//
//  CardView.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/21/24.
//

import SwiftUI


struct CardView: View {
    
    @Binding var card: Card
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var index: Int
    
    var body: some View {
        ZStack {
            // Card Facedown
            if !card.isFaceUp {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(.blue)
                    .shadow(color: .gray, radius: 3)
             
                VStack {
                    // Card text
                    Text(card.isFaceUp ? card.emoji : "")
                }
                .font(.system(size: 40))
                
            
            } else {
                if card.isMatched {                             // <-- if a card is matched, then fill the space it use to occupy with a white rectangle
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.white)
                } else {                                      // <-- the card is face up
                    RoundedRectangle(cornerRadius: 15.0)
                        .fill(.white)
                        .stroke(Color.black, lineWidth: 4)
                        
                    VStack {
                        // Card image
                        Text(card.emoji)
                    }
                    .font(.system(size: 40))
                }
            }
        }
        .rotation3DEffect(.degrees(card.isFaceUp ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.default, value: card.isFaceUp)
        .frame(width: 115, height: 160)
        .onTapGesture {
            if !card.isMatched && !card.isFaceUp {
                gameViewModel.cards[index].isFaceUp.toggle()
                gameViewModel.selectedCards.append(card)
                
            }
        }
    }
}

#Preview {
    CardView(card: .constant(Card(emoji: "🚀")), index: 0)
    .environmentObject(GameViewModel())
        
    
}
