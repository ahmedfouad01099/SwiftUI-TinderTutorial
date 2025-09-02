//
//  User.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import Foundation

struct User: Identifiable {
    let id: String
    let fullname: String
    let age: Int
    let profileImageURLs: [String]
}
