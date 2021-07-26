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
        .navigationTitle("Emoji game")
    }
    
    @ViewBuilder // <-- pay attention to this declaration. It explains to compile that this function is also a ViewBuilder
    private func cardView(for card: MemoryGameModel<String>.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Color.clear
        } else {
            GeometryReader { geometry in
                CardView(card: card, content: Text(card.content)
                            .font(.system(size: DrawingConstants.fontSize))
                            .scaleEffect(scale(thatFits: geometry.size)))
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
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        return min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    fileprivate struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32.0
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
