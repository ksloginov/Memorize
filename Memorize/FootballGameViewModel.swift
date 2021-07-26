//
//  FootballGameViewModel.swift
//  Memorize
//
//  Created by Konstantin Loginov on 26.07.2021.
//

import Foundation

class FootballGameViewModel: ObservableObject {

    static let footballClubLogoUrlTemplate = "https://images.fotmob.com/image_resources/logo/teamlogo/%d.png"
    static let popularFootballTeams = "https://pub.fotmob.com/prod/pub/onboarding"
    
    private static func createMemoryGame(ids: [Int]) -> MemoryGameModel<Int> {
        return MemoryGameModel<Int>(numberOfPairsOfCards: min(12, ids.count)) { pairIndex in
            return ids[pairIndex]
        }
    }
    
    @Published private var model: MemoryGameModel<Int> = createMemoryGame(ids: [])
    
    init() {
        guard let url = URL(string: FootballGameViewModel.popularFootballTeams) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let teamIds = try? JSONDecoder().decode(TeamList.self, from: data).suggestedTeams.map({$0.id})
            DispatchQueue.main.async { [weak self] in
                if let ids = teamIds {
                    self?.model = FootballGameViewModel.createMemoryGame(ids: ids)
                }
            }
        }.resume()
    }
    
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
