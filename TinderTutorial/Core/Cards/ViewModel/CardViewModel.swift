//
//  CardViewModel.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import Foundation

@MainActor
class CardViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModels() }
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG: Failed to fetch card with error: \(error)")
        }
    }
    
    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id  }) else { return }
        
        cardModels.remove(at: index)
    }
    
}
