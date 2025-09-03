//
//  CardView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 01/09/2025.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degress: Double = 0
    @State private var currentImageIndex = 0
    @State private var mockImages = [
        "ahmed",
        "ahmed-1",
    ]
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: SizeConstants.cardWidth,
                        height: SizeConstants.cardHeight
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        ImageScrollingOverlay(
                            currentImageIndex: $currentImageIndex,
                            imageCount: imageCount
                        )
                    }
                CardImageIndicatorView(
                    currentImageIndex: currentImageIndex,
                    imageCount: imageCount
                )
                SwipeActionIndicatorView(xOffset: $xOffset)
            }

            UserInfoView(user: user)
        }
        .onAppear {
            print("CardView model: \(model)")
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

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degress = 0
    }
    
    func swipeRight() {
        xOffset = 500
        degress = 12
        
        viewModel.removeCard(model)
    }
    
    func swipteLeft() {
        xOffset = -500
        degress = -12
        
        viewModel.removeCard(model)
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
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipteLeft()
        }
    }
}

#Preview {
    CardView(
        viewModel: CardViewModel(
            service: CardService()
        ),
        model: CardModel(
            user: MockData.users[0]
        )
    )
}
