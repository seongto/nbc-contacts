//
//  DummyPokemon.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/11/24.
//


/// UserDefaults에 저장된 데이터가 없거나 네트워크 에러시 사용되는 고라파덕.
struct PokemonDummyData: Codable {
    static func getDummyPsyduck() -> PokemonResponse {
        return PokemonResponse(
            id: 0,
            name: "dummyDuck",
            sprites: Sprites(
                backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/54.png",
                frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/54.png",
                frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/54.png"
            ),
            types: [
                PokemonType(
                    slot: 1,
                    type: TypeDetail(
                        name: "water",
                        url: "https://pokeapi.co/api/v2/type/11/"
                    )
                )
            ]
        )
    }
    
    static func getPikachu() -> PokemonResponse {
        return PokemonResponse(
            id: 25,
            name: "Pikachu",
            sprites: Sprites(
                backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png",
                frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
                frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png"
            ),
            types: [
                PokemonType(
                    slot: 1,
                    type: TypeDetail(
                        name: "electric",
                        url: "https://pokeapi.co/api/v2/type/13/"
                    )
                )
            ]
        )
    }
}
