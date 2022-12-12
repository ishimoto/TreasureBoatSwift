//
//  CharacterScreenVM.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/06/26.
//

import Foundation

extension CharacterScreen {
    
    class CharacterScreenVM: ObservableObject {
        
        private let service: CharacterService
        
        init(service: CharacterService) {
            self.service = service
        }
        
        enum State {
            case notAvailable
            case loading
            case success(data: [Character])
            case failed(error: Error)
        }
        
        @Published private(set) var state: State = .notAvailable
        @Published var hasError: Bool = false
        
        @MainActor
        func getCharacters() async {
            
            self.state = .loading
            self.hasError = false
            
            do {
                let characters = try await service.fetchCharacters()
                self.state = .success(data: characters)

            } catch {
                self.state = .failed(error: error)
                self.hasError = true
            }
        }
        
        
    }
}
