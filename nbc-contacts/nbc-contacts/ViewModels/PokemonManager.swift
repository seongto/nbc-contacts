//
//  PokemonManager.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import Foundation


/// 포켓몬 데이터를 가져오고 이를 저장 및 수정 등의 기능을 제고
struct PokemonManager {
    
    /// 랜덤 포켓몬 이미지를 가져오는 메소드
    /// 포켓몬 데이터를 매번 UserDefaults에 저장하고 이미 해당 번호에 대한 정보가 있을 경우 네트워크 호출하지 않고 기존 정보를 반환. 없을 경우 새로 호출하고 새로 저장.
    /// - Returns: <#description#>
    func fetchRandomPokemon() -> PokemonResponse {
        // 포켓몬 정보를 네트워크에서 가져오는 것을 실패했을 경우를 대비한 기본값
        let psyDuck = PokemonDummyData.getDummyPsyduck()
        
        let randomId: Int = Int.random(in: 1...1000)
        var pokemons = loadPokemons()
        
        if let pokemon: PokemonResponse = pokemons[randomId] {
            return pokemon
        } else {
            guard let result = PokemonAPI.fetchPokemonData(id: randomId) else {
                return psyDuck
            }
            
            pokemons[randomId] = result
            savePokemons(pokemonDict: pokemons)
            
            return result
        }
    }
}


// MARK: - private 메소드 분리

extension PokemonManager {
    /// UserDefaults 에 저장된 포켓몬 데이터를 가져온다.
    /// - Returns: 포켓몬의 number를 key로, PokemonResponse 타입 객체를 value로 갖는 딕셔너리 반환
    private func loadPokemons() -> [Int:PokemonResponse] {
        let decoder = JSONDecoder()
        
        guard let data = UserDefaults.standard.data(forKey: "pokemons") else {
            return [:]
        }
        
        do {
            let pokemonDict = try decoder.decode([Int:PokemonResponse].self, from: data) // Data를 딕셔너리로 디코딩
            return pokemonDict
        } catch {
            print("Error : \(error)")
            return [:]
        }
    }
    
    /// UserDefaults 에 변경된 포켓몬 데이터를 저장한다.
    /// - Parameter pokemonDict: [Int:PokemonResponse] - 포켓몬의 number를 key로, PokemonResponse 타입 객체를 value로 갖는 딕셔너리
    private func savePokemons(pokemonDict: [Int: PokemonResponse]) {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(pokemonDict)
            
            UserDefaults.standard.set(data, forKey: "pokemons")
        } catch {
            print("Error : \(error)")
        }
    }
}
