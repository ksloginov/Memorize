//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        VStack {
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3, content: { card in
                cardView(for: card)
            })
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
    
    @ViewBuilder // <-- pay attention to this declaration. It explains to compile that this function is also a ViewBuilder
    private func cardView(for card: MemoryGameModel<String>.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Color.clear
        } else {
            CardView(card: card)
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















struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGameViewModel()
        EmojiMemoryGameView(viewModel: viewModel)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(viewModel: viewModel)
            .preferredColorScheme(.light)
    }
}
