//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let emojiGameViewModel = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: emojiGameViewModel)
        }
    }
}
