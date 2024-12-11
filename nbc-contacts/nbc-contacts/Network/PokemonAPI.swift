//
//  PokemonAPI.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit
import Alamofire

struct PokemonAPI {
    static func fetchPokemonData(id: Int) async -> PokemonResponse? {
        let urlComponents = URLComponents(string: "https://pokeapi.co/api/v2/pokemon/\(id)")
        
        guard let url = urlComponents?.url else {
            print("잘못된 URL")
            return nil
        }
        
        do {
            let response = try await AF.request(url).serializingDecodable(PokemonResponse.self).value
            return response
        } catch {
            print("Pokemon Error : \(error.localizedDescription)")
            return nil
        }
    }
}
