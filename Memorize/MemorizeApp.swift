//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Konstantin Loginov on 23.07.2021.
//

import SwiftUI
import Firebase
import Mixpanel

@main
struct MemorizeApp: App {
    
    init() {
        FirebaseApp.configure()
        Mixpanel.initialize(token: "0fb79eb7f4372cf4568f3caf79bf1da8")
        
        Mixpanel.mainInstance().track(event: "App Started")
    }
    
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
