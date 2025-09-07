//
//  CardStackView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardViewModel(service: CardService())
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(viewModel.cardModels) { card in
                        CardView(viewModel: viewModel, model: card)
                    }
                }
                if !viewModel.cardModels.isEmpty {
                    SwipeActionButtonView(viewModel: viewModel)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 60)
                }

            }
        }
    }
}

#Preview {
    CardStackView()
}
