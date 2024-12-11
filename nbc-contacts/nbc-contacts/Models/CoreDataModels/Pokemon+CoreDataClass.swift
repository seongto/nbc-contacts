//
//  Pokemon+CoreDataClass.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/12/24.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: TimeStamp {
    
    /// CREATE - 새로운 Pokemon 생성
    /// - Parameters:
    ///   - context: NSManagedObjectContext (필수)
    ///   - name: String - 포켓몬 이름
    ///   - number: Int - 포켓몬 번호
    ///   - imageUrl: String - 포켓몬 이미지 URL
    /// - Returns: 생성된 Pokemon 객체
    public static func insert(in context: NSManagedObjectContext, pokemon: PokemonResponse) -> Pokemon? {
        
        let newPokemon = Pokemon(context: context)
        
        newPokemon.name = pokemon.name
        newPokemon.number = Int16(pokemon.id)
        newPokemon.spriteFront = pokemon.sprites.frontDefault
        newPokemon.spriteBack = pokemon.sprites.backDefault ?? ""
        newPokemon.spriteShiny = pokemon.sprites.frontShiny ?? ""
        newPokemon.createdAt = Date()
        newPokemon.updatedAt = Date()
        
        do {
            try context.save()
            print("Pokemon 생성 완료: \(pokemon.name)")
            return newPokemon
        } catch {
            print("Insert 에러: \(error.localizedDescription)")
            return nil
        }
    }
    
    /// READ - 모든 Pokemon 조회
    /// - Parameter context: NSManagedObjectContext
    /// - Returns: 모든 Pokemon 목록
    public static func selectAll(in context: NSManagedObjectContext) -> [Pokemon] {
        
        let request: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        
        do {
            let pokemons = try context.fetch(request)
            print("총 \(pokemons.count)개의 Pokemon을 불러왔습니다.")
            return pokemons
        } catch {
            print("Select 에러: \(error.localizedDescription)")
            return []
        }
    }
    
    /// READ - 특정 조건의 Pokemon 목록 조회
    /// - Parameters:
    ///   - context: NSManagedObjectContext
    ///   - predicate: NSPredicate - 조건
    /// - Returns: 조건에 맞는 Pokemon 목록
    public static func selectFiltered(in context: NSManagedObjectContext, predicate: NSPredicate) -> [Pokemon] {
        
        let request: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        request.predicate = predicate
        
        do {
            let pokemons = try context.fetch(request)
            print("조건에 맞는 \(pokemons.count)개의 Pokemon을 불러왔습니다.")
            return pokemons
        } catch {
            print("Select 에러: \(error.localizedDescription)")
            return []
        }
    }
    
    
    /// DELETE - Pokemon 삭제
    /// - Parameter context: NSManagedObjectContext
    /// - Returns: 성공 여부 (true/false)
    public func delete(in context: NSManagedObjectContext) -> Bool {
        context.delete(self)
        
        do {
            try context.save()
            print("✅ DELETE 성공")
            return true
        } catch {
            print("❌ DELETE 에러: \(error.localizedDescription)")
            return false
        }
    }
    
    
    /// Soft DELETE - 소프트삭제 : 실제로 데이터를 삭제하진 않고 deletedAt에 날짜를 기록
    /// - Parameter context: NSManagedObjectContext
    /// - Returns: 성공 여부 true / false
    public func softDelete(in context: NSManagedObjectContext) -> Bool {
        self.updatedAt = Date()
        self.deletedAt = Date()
        
        do {
            try context.save()
            print("✅ DELETE 성공")
            return true
        } catch {
            print("❌ DELETE 에러: \(error.localizedDescription)")
            return false
        }
    }
}
