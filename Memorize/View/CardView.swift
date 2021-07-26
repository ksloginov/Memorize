//
//  CardView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 24.07.2021.
//

import SwiftUI

struct CardView<Value: Equatable, Content: View>: View {
    
    var card: MemoryGameModel<Value>.Card
    
    var content: Content
    
    var body: some View {
        ZStack {
            content
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false))
        }
        .cardify(isFaceUp: card.isFaceUp)
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGameModel<String>.Card(isFaceUp: true, isMatched: false, content: "🚀", id: 42), content: Text("🚀"))
    }
}
