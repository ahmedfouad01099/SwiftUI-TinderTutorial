//
//  TinderTutorialApp.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 01/09/2025.
//

import SwiftUI

@main
struct TinderTutorialApp: App {
    @StateObject var matchManager = MatchManager()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}
