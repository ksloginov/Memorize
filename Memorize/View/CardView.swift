//
//  CardView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 24.07.2021.
//

import SwiftUI

struct CardView: View {
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .stroke(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * DrawingConstants.fontScale))
                } else if card.isMatched {
                    shape.opacity(0.0)
                } else {
                    shape
                        .fill()
                }
            }
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10.0
        static let lineWidth: CGFloat = 3.0
        static let fontScale: CGFloat = 0.7
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGameModel<String>.Card(isFaceUp: true, isMatched: false, content: "🚀", id: 42))
    }
}
