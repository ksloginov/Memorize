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
        
        for pairIndex in 0..<numberOfPairsOfCards {
            var content: CardContent = ...
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
            cards.append(Card(isFaceUp: false, isMatched: false, content: <#T##CardContent#>))
        }
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
