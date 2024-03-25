//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/21/24.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(gameViewModel)
        }
    }
}
