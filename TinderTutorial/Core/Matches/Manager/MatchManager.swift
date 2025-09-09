//
//  MatchManager.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 09/09/2025.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user: User) {
        if Bool.random() {
            matchedUser = user
        }
    }
}
