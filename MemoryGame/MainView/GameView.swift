//
//  ContentView.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/21/24.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
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
