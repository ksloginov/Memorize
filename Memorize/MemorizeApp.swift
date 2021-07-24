//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let emojiGameViewModel = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EmojiMemoryGameView(viewModel: emojiGameViewModel)
                    .navigationTitle(Text(Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""))
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
