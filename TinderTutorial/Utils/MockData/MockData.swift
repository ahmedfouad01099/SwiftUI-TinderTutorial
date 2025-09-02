//
//  MockData.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullname: "Ahmed Fouad",
            age: 27,
            profileImageURLs: [
                "ahmed",
                "ahmed-1"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Mohamed Mosad",
            age: 27,
            profileImageURLs: [
                "ahmed",
                "ahmed-1"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Amr Shalaby",
            age: 27,
            profileImageURLs: [
                "ahmed",
                "ahmed-1"
            ]
        )

    ]
}
