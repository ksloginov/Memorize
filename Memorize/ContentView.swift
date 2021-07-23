//
//  ContentView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3.0)
                .padding(.horizontal)
                .foregroundColor(.red)
            Text("Hello, Kristiania 2021/2022!")
                .foregroundColor(.orange)
                .padding()
        })
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
