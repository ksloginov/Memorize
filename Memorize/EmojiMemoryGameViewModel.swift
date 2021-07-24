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
    
    var emojies = ["❤️", "👨🏻‍🍳", "💩", "😡", "😧", "🤖", "🎩", "🐯", "🦺", "💍", "🎒", "🐎", "🐩", "🦧", "🐳", "🐕", "🦄", "🦀", "🐿", "🦔", "🦦", "🦢", "🦜"]
    
    private var model: MemoryGameModel<String> = MemoryGameModel<String>(numberOfPairsOfCards: 4) { pairIndex in
        return emojies[pairIndex]
    }
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
}
