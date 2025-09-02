//
//  CardViewModel.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 02/09/2025.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    
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
}
