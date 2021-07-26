//
//  FootballGameViewModel.swift
//  Memorize
//
//  Created by Konstantin Loginov on 26.07.2021.
//

import Foundation

class FootballGameViewModel: ObservableObject {

    private static let footballClubIds = [10241, 8686, 8685]
    
    private static func createMemoryGame() -> MemoryGameModel<Int> {
        return MemoryGameModel<Int>(numberOfPairsOfCards: 3) { pairIndex in
            return footballClubIds[pairIndex]
        }
    }
    
    @Published private var model: MemoryGameModel<Int> = createMemoryGame()
    
    var cards: Array<MemoryGameModel<Int>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGameModel<Int>.Card) {
        model.choose(card: card)
    }
    
    func restart() {
        model.restart()
    }
}
