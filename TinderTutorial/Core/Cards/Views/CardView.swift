//
//  CardView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 01/09/2025.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degress: Double = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top){
                Image(.ahmed)
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardWidth, height: cardHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                SwipeActionIndicatorView(xOffset: $xOffset, screenCutoff: screenCutOff)
            }

            UserInfoView()
        }
        .offset(x: xOffset)
        .rotationEffect(.degrees(degress))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degress = Double(value.translation.width) / 25
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width

        if abs(width) <= abs(screenCutOff) {
            xOffset = 0
            degress = 0
        }
    }
}

extension CardView {
    fileprivate var screenCutOff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    fileprivate var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }

    fileprivate var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
#Preview {
    CardView()
}
