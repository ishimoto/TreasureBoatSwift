//
//  CharacterService.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/06/26.
//

import Foundation
import TreasureBoatSwift

struct CharacterService {
    
    enum CharacterServicError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    func fetchCharacters() async throws -> [Character] {
        
        let url = "https://rickandmortyapi.com/api/character".url()

        // only for testing
        //        let configuration = URLSessionConfiguration.ephemeral // NO CACHING at all
        //        let (data, response) = try await URLSession(configuration: configuration).data(from: url)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CharacterServicError.invalidStatusCode
        }

        let decodeData = try JSONDecoder().decode(CharacterServiceResult.self, from: data)
        return decodeData.results
    }
}
