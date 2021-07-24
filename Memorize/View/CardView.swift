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
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeOut(duration: 2).repeatForever())
                    .font(Font.system(size: min(geometry.size.width, geometry.size.height) * DrawingConstants.fontScale))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGameModel<String>.Card(isFaceUp: true, isMatched: false, content: "🚀", id: 42))
    }
}
