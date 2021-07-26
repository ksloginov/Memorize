//
//  CardView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 24.07.2021.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    var card: MemoryGameModel<String>.Card
    
    var content: Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                content
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
                    .font(.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        return min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
}

fileprivate struct DrawingConstants {
    static let fontScale: CGFloat = 0.7
    static let fontSize: CGFloat = 32.0
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGameModel<String>.Card(isFaceUp: true, isMatched: false, content: "🚀", id: 42), content: Text("🚀"))
    }
}
