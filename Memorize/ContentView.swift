//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    var emojies = ["❤️", "👨🏻‍🍳", "💩", "😡", "😧", "🤖", "🎩", "🐯", "🦺", "💍", "🎒", "🐎", "🐩", "🦧", "🐳", "🐕", "🦄", "🦀", "🐿", "🦔", "🦦", "🦢", "🦜"]
    @State var emojiCount = 4
    
    var body: some View {
        
        VStack {
            HStack {
                ForEach(emojies[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Button(action: {
                emojiCount += 1
            }, label: {
                Text("Add Card")
            })
        }
        .foregroundColor(.red)
        .padding()
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3.0)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
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
