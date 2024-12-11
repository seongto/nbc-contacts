//
//  PokemonAPI.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import UIKit
import Alamofire

struct PokemonAPI {
    static func fetchPokemonData(id: Int) -> PokemonResponse? {
        var urlComponents = URLComponents(string: "https://pokeapi.co/api/v2/pokemon/\(id)")
        
        guard let url = urlComponents?.url else {
            print("잘못된 URL")
            return nil
        }
        
        var response: PokemonResponse?
        
        DataFetcher.fetchByAlamo(url: url) { (result: Result<PokemonResponse, AFError>) in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    response = result
                    print(result)
                }
                
            case .failure(let error):
                AppHelpers.showAlert(title: "Error가 나타났다!", message: "잠시 후 다시 시도해주세요.")
            }
        }
        
        return response
    }
}
