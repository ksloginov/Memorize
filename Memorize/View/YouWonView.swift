//
//  YouWonView.swift
//  Memorize
//
//  Created by Konstantin Loginov on 26.07.2021.
//

import SwiftUI

struct YouWonView: View {
    var body: some View {
        VStack {
            Text("You won! 🥳")
                .padding()
            Text("Please press \"Restart\" to start again")
        }
        .font(.headline)
    }
}

struct YouWonView_Previews: PreviewProvider {
    static var previews: some View {
        YouWonView()
    }
}
