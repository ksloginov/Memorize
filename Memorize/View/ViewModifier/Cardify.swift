//
//  Cardify.swift
//  Memorize
//
//  Created by Konstantin Loginov on 24.07.2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.fill(Color.white)
                shape.stroke(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            
            content.opacity(isFaceUp ? 1.0 : 0.0)
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10.0
        static let lineWidth: CGFloat = 3.0
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
