//
//  CardView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 01/09/2025.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var matchManager: MatchManager
    @ObservedObject var viewModel: CardViewModel
    
    @State private var xOffset: CGFloat = 0
    @State private var degress: Double = 0
    @State private var currentImageIndex = 0
    @State private var mockImages = [
        "ahmed",
        "ahmed-1",
    ]
    @State private var showProfileView: Bool = false

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

            UserInfoView(user: user, showUserProfile: $showProfileView)
        }
        .fullScreenCover(
            isPresented: $showProfileView
        ) {
            UserProfileView(user: user)
        }
        .onAppear {
            print("CardView model: \(model)")
        }
        .onReceive(
            viewModel.$buttonSwipeAction,
            perform: { action in
                onReceiveSwipeAction(action)
            }
        )
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
    fileprivate var user: User {
        return model.user
    }

    fileprivate var imageCount: Int {
        return user.profileImageURLs.count
    }
}

extension CardView {
    func returnToCenter() {
        xOffset = 0
        degress = 0
    }

    func swipeRight() {
        withAnimation {
            xOffset = 500
            degress = 12

        } completion: {
            viewModel.removeCard(model)
            matchManager.checkForMatch(withUser: user)
        }

    }

    func swipteLeft() {
        withAnimation {
            xOffset = -500
            degress = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }

    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }

        let topCard = viewModel.cardModels.last

        if topCard == model {
            switch action {
            case .reject:
                swipteLeft()
            case .like:
                swipeRight()
            }
        }

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
    .environmentObject(MatchManager())
}
