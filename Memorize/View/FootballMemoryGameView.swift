//
//  FootballMemoryGameView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI
import SDWebImageSwiftUI
import Mixpanel

struct FootballMemoryGameView: View {
    
    @ObservedObject var viewModel: FootballGameViewModel
    
    var body: some View {
        ZStack {
            YouWonView()
                .opacity(viewModel.hasSolvedPuzzle ? 1.0 : 0.0)
            VStack {
                AspectVGrid(items: viewModel.cards, aspectRatio: 2/3, content: { card in
                    cardView(for: card)
                })
                .opacity(viewModel.hasSolvedPuzzle ? 0.0 : 1.0)
                .padding(.top, 12)
                .foregroundColor(.red)
            }
            .padding(.horizontal)
            .navigationBarItems(trailing: Button(action: {
                withAnimation {
                    viewModel.restart()
                }
            }) {
                Text("Restart")
                    .foregroundColor(.red)
            })
        }
        .navigationTitle("Football game")
        .onAppear {
            Mixpanel.mainInstance().track(event: "Football game opened")
        }
    }
    
    @ViewBuilder // <-- pay attention to this declaration. It explains to compile that this function is also a ViewBuilder
    private func cardView(for card: MemoryGameModel<Int>.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Color.clear
        } else {
            GeometryReader { geometry in
                CardView(card: card,
                         content: WebImage(url: URL(string: String(format: FootballGameViewModel.footballClubLogoUrlTemplate, card.content)))
                            .resizable()
                            .frame(width: min(geometry.size.height, geometry.size.width) * 0.7,
                                   height: min(geometry.size.height, geometry.size.width) * 0.7))
                    .modifier(Cardify(isFaceUp: card.isFaceUp))
                    .padding(4.0)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        withAnimation {
                            viewModel.choose(card)
                        }
                    }
            }
        }
    }
}















struct FootballMemoryGameViewE_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FootballGameViewModel()
        FootballMemoryGameView(viewModel: viewModel)
            .preferredColorScheme(.dark)
        FootballMemoryGameView(viewModel: viewModel)
            .preferredColorScheme(.light)
    }
}
