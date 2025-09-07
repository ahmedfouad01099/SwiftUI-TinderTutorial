//
//  SizeConstents.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import SwiftUI

struct SizeConstants {
   static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 5
    }

    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
