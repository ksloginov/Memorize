//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGameViewModel
    
    @State var emojiCount = 15
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.model.cards, id: \.self) { emoji in
                        CardView(card: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3.0)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
//        .onTapGesture {
//            card.isFaceUp = !card.isFaceUp
//        }
    }
}



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGameViewModel()
        ContentView(viewModel: viewModel)
            .preferredColorScheme(.dark)
        ContentView(viewModel: viewModel)
            .preferredColorScheme(.light)
    }
}
