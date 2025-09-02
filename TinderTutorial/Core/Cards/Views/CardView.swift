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
    @State private var currentImageIndex = 1
    @State private var mockImages = [
        "ahmed",
        "ahmed-1"
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(mockImages[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: SizeConstants.cardWidth,
                        height: SizeConstants.cardHeight
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: mockImages.count)
                    }

                SwipeActionIndicatorView(xOffset: $xOffset)
                SwipeActionIndicatorView(xOffset: $xOffset)
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
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degress = Double(value.translation.width) / 25
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width

        if abs(width) <= abs(SizeConstants.screenCutoff) {
            xOffset = 0
            degress = 0
        }
    }
}

#Preview {
    CardView()
}
