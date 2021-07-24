//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Konstantin Loginov on 24.07.2021.
//

import Foundation

func makeCardContent(index: Int) -> String {
    return "🦄"
}

class EmojiMemoryGameViewModel {
    
    static let emojies = ["❤️", "👨🏻‍🍳", "💩", "😡", "😧", "🤖", "🎩", "🐯", "🦺", "💍", "🎒", "🐎", "🐩", "🦧", "🐳", "🐕", "🦄", "🦀", "🐿", "🦔", "🦦", "🦢", "🦜"]
    
    static func createMemoryGame() -> MemoryGameModel<String> {
        return MemoryGameModel<String>(numberOfPairsOfCards: 4) { pairIndex in
            return emojies[pairIndex]
        }
    }
    
    private var model: MemoryGameModel<String> = createMemoryGame()
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
}
