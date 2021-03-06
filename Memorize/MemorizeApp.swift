//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    @State var count = 0
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                GamesListview()
                    .navigationTitle(Text(Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""))
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
