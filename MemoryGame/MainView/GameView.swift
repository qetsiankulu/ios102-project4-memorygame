//
//  ContentView.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/21/24.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        
        // Game Header
        GameHeader()
        
        // Game Grid
        CardGrid()
    }
}

#Preview {
    GameView()
        .environmentObject(GameViewModel())
}
