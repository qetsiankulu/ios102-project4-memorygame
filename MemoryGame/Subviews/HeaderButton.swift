//
//  HeaderButton.swift
//  MemoryGame
//
//  Created by Qetsia Nkulu  on 3/24/24.
//

import SwiftUI

struct HeaderButton: View {
    
    var title: String
    var backgroundColor: Color
    var action: () -> ()
    
    var body: some View {
        Button(action: {
                    action()
                },
               label: {
                    Text(title).foregroundStyle(.white)
        })
        .padding()
        .background(backgroundColor)
        .clipShape(Capsule())
        .foregroundStyle(.white)
    }
}

#Preview {
    HeaderButton(title: "Choose Size", backgroundColor: .orange) {}
}
