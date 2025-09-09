//
//  CardStackView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import SwiftUI

struct CardStackView: View {
    @EnvironmentObject var matchManager: MatchManager
    @State private var showMatchView = true
    @StateObject var viewModel = CardViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                .blur(radius: showMatchView ? 20 : 0)
 
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .animation(.easeInOut, value: showMatchView)
            .onReceive(matchManager.$matchedUser) { user in
                showMatchView = user != nil
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
        .environmentObject(MatchManager())
}
