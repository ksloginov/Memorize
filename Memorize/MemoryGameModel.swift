//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Konstantin Loginov on 24.07.2021.
//

import Foundation

struct MemoryGameModel<CardContent> { 
    private (set) var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
