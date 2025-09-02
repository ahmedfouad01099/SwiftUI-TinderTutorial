//
//  CardModel.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import Foundation

struct CardModel {
    let user: User
}


extension CardModel: Identifiable {
    var id: String {
        return user.id
    }
}
