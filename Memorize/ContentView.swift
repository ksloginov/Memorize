//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.red)
        .padding()
    }
}

struct CardView: View {
    
    var isFaceUp: Bool { return false }
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3.0)
                Text("🤷‍♂️")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
    }
}



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
