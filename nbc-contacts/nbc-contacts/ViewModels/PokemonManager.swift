//
//  PokemonManager.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/10/24.
//

import UIKit
import CoreData


/// 포켓몬 데이터를 가져오고 이를 저장 및 수정 등의 기능을 제공
class PokemonManager {
    
    var newPokemon: PokemonResponse?
    var container: NSPersistentContainer
    var context: NSManagedObjectContext { container.viewContext }
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer

        testPokemon()
    }
    
    
    func testPokemon() {
        Task {
//            let newMon = await fetchRandomPokemon()
//            print(newMon)
//            
//            if let newPokemon = Pokemon.insert(in: context, pokemon: newMon) {
//                print("New Pokemon Created: \(newPokemon)")
//            }
            
            
//            let pokemons = Pokemon.selectAll(in: context)
//            let objectID = pokemons[0].objectID
//            print(objectID)
//            print(type(of: objectID))
//            
//            let predicate = NSPredicate(format: "SELF == %@", objectID)
//            let filteredContacts = Pokemon.selectFiltered(in: context, predicate: predicate)
            
//            let predicate = NSPredicate(format: "number == %d", 100)
            
            let pokemonsInCoreData = Pokemon.selectAll(in: context)
            let pokemonsInUserDefaults = loadPokemonsFromUserDefaults()
            
//            pokemonsInCoreData.forEach {
//                var isDel = $0.delete(in: context)
//                if isDel { print("\($0.name ?? "?") 지운다!") }
//            }
//            UserDefaults.standard.set([:], forKey: "pokemons")
            
            
            let namesCore = pokemonsInCoreData.map {
                $0.name ?? "?"
            }
            
            let namesUser = pokemonsInUserDefaults.map {
                $0.value.name
            }
            
            print("Core : \(namesCore)")
            print("User : \(namesUser)")
        }
        
    }
    
    /// 랜덤 포켓몬 데이터를 가져오는 메소드
    /// 포켓몬 데이터를 매번 CoreData에 저장하고 이미 해당 번호에 대한 정보가 있을 경우 네트워크 호출하지 않고 기존 정보를 반환. 없을 경우 새로 호출하고 새로 저장.
    /// UserDefaults에는 CoreData 모델 타입이 아닌 PokemonResponse 데이터를 저장해보자.
    /// - Returns: 값이 없으면 더미덕(0, dummyDuck), 값이 있으면 해당 포켓몬 데이터(response) 반환.
    func fetchRandomPokemon() async -> PokemonResponse {
        // 포켓몬 정보를 네트워크에서 가져오는 것을 실패했을 경우를 대비한 기본값
        let dummyDuck = PokemonDummyData.getDummyPsyduck()
        
        let randomId: Int = Int.random(in: 1...1000)
        
        // 저장을 위한 절차
        // 1. 기존에 저장된 포켓몬 여부 탐색
        let predicate = NSPredicate(format: "number == %d", randomId)
        let checkDup = Pokemon.selectFiltered(in: context, predicate: predicate)
        
        if checkDup.isEmpty {
            // 2. 없다면 코어 데이터에 해당 포켓몬 저장하고, 그 데이터를 UserDefaults에도 저장
            guard let result = await PokemonAPI.fetchPokemonData(id: randomId) else {
                return dummyDuck
            }
            
            // 2-1. 코어데이터에 저장.
            if Pokemon.insert(in: context, pokemon: result) != nil {
                
                // 2-2. 코어데이터에 저장된 객체와 다른 원래 Response 타입의 result를 UserDefaults에 저장
                savePokemonsToUserDefaults(pokemon: result)
                
                // return은 아직 Contact에 저장되지 않은 데이터를 기반으로 하므로 result로 반환
                return result
            } else {
                return dummyDuck
            }
        } else {
            // 3. 있다면 해당 포켓몬 데이터를 UserDefaults에서 불러와서 반환.
            let pokemonDict = loadPokemonsFromUserDefaults()
            
            guard let result = pokemonDict[randomId] else {
                return dummyDuck
            }
                        
            return result
        }
    }
}


// MARK: - private 메소드 분리

extension PokemonManager {
    
    /// UserDefaults 에 저장된 포켓몬 데이터를 가져온다.
    /// - Returns: 포켓몬의 number를 key로, PokemonResponse 타입 객체를 value로 갖는 딕셔너리 반환
    private func loadPokemonsFromUserDefaults() -> [Int:PokemonResponse] {
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
    private func savePokemonsToUserDefaults(pokemon: PokemonResponse) {
        let encoder = JSONEncoder()
        
        do {
            var pokemonDict = loadPokemonsFromUserDefaults()
                        
            pokemonDict[pokemon.id] = pokemon
                        
            let data = try encoder.encode(pokemonDict)
                        
            UserDefaults.standard.set(data, forKey: "pokemons")
        } catch {
            print("Error : \(error)")
        }
    }
}
