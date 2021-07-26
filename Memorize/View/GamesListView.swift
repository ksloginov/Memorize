//
//  GamesListView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 26.07.2021.
//

import SwiftUI

struct GamesListview: View {
    
    private let emojiGameViewModel = EmojiMemoryGameViewModel()
    
    var body: some View {
        List {
            NavigationLink(destination: EmojiMemoryGameView(viewModel: emojiGameViewModel)) {
                Text("Emoji game 🤖")
                    .font(.largeTitle)
                    .padding(.vertical)
            }
        }
    }
}
