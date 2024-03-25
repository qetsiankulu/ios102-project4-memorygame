//
//  GameHeader.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/24/24.
//

import SwiftUI

struct GameHeader: View {
    
    @EnvironmentObject var GameViewModel: GameViewModel
    
    var body: some View {
        HStack {
            // Use a Menu object to create the choose size button that show the different number of pairs possible
            Menu("Choose Size") {
                ForEach(CardCount.allCases, id: \.rawValue) { count in
                    Button("\(count.rawValue / 2) Pairs ") {
                        GameViewModel.startGame(cardCount: count)
                    }
                }
            }
            .padding()
            .foregroundStyle(.white)
            .background(Color.orange)
            .clipShape(Capsule())
            
            Spacer()
            
            // Use the GameButton() to create the reset button and pass the GameViewModel's startGame method as the button's action
            HeaderButton(title: "Reset Game", backgroundColor: .indigo) {
                GameViewModel.startGame(cardCount: GameViewModel.cardCount)
            }
        }
        .padding()
        .background(.cyan)
    }
}

#Preview {
    GameHeader()
}
