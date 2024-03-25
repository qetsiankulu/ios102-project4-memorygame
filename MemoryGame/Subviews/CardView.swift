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
            if card.isFaceDown {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(.blue)
                    .shadow(color: .gray, radius: 3)
             
                VStack {
                    // Card text
                    Text(card.isFaceDown ? "" : card.emoji)
                }
                .font(.system(size: 40))
                
            // Card Faceup
            } else {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(.white)
                    .stroke(Color.black, lineWidth: 4)
                
                VStack {
                    // Card text
                    Text(card.emoji)
                }
                .font(.system(size: 40))
            }
        }
        .animation(.default, value: !card.isFaceDown)
        .frame(width: 115, height: 160)
        .onTapGesture {
               // if the card is not matched and is face down,
            
            if !card.isMatched && card.isFaceDown {
                gameViewModel.cards[index].isFaceDown.toggle()
                gameViewModel.selectedCards.append(card)
                
            }
            }
    }
}

#Preview {
    CardView(card: .constant(Card(emoji: "🚀")),
             index: 0)
        
    
}
