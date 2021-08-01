//
//  GamesListView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 26.07.2021.
//

import SwiftUI

struct GamesListview: View {
    
    @StateObject private var emojiGameViewModel = EmojiMemoryGameViewModel()
    @StateObject private var footballGameViewModel = FootballGameViewModel()
    
    var body: some View {
        List {
            NavigationLink(destination: EmojiMemoryGameView(viewModel: emojiGameViewModel)) {
                Text("Emoji game 🤖")
                    .font(.largeTitle)
                    .padding(.vertical)
            }
            
            NavigationLink(destination: FootballMemoryGameView(viewModel: footballGameViewModel)) {
                Text("Football game ⚽️")
                    .font(.largeTitle)
                    .padding(.vertical)
            }
        }
    }
}
