//
//  CardView.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/21/24.
//

import SwiftUI

// Card data model
struct Card {
    let emoji : String
}

struct CardView: View {
    
    let card : Card
    
    @State private var isCardFaceDown = true
    
    var body: some View {
        ZStack {
            
            // Card background
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(isCardFaceDown ? .blue : .white )
                .stroke(isCardFaceDown ? Color.clear : Color.black, lineWidth: 4)
            
            VStack {
                // Card text
                Text(isCardFaceDown ? "" : card.emoji)
            }
            .font(.system(size: 50))
        }
        .frame(width: 300, height: 500)
        .onTapGesture {
            isCardFaceDown.toggle()
        }
    }
}

#Preview {
    CardView(card: Card(emoji: "🚀"))
}
