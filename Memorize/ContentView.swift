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
    
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = Circle()
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3.0)
                Text("🤷‍♂️")
                    .font(.largeTitle)
            } else {
                shape
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
