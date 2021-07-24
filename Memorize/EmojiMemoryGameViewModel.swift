//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Konstantin Loginov on 24.07.2021.
//

import Foundation

class EmojiMemoryGameViewModel {
    private var model: MemoryGameModel<String>
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
}
