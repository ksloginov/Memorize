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
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3.0)
                Text("Hello, Kristiania 2021/2022!")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3.0)
                Text("Hello, Kristiania 2021/2022!")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3.0)
                Text("Hello, Kristiania 2021/2022!")
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3.0)
                Text("Hello, Kristiania 2021/2022!")
            }
        }
        .foregroundColor(.red)
        .padding()
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
