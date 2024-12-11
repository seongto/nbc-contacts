//
//  PokemonResponse.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import Foundation

// MARK: - WelcomeMe

/// 다음의 포켓몬 API로부터 필요한 정보만 가져오기 : pokeapi.co/api/v2/pokemon/{id or name}/
struct PokemonResponse: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [PokemonType]

}

// MARK: - Sprites

/// 포켓몬의 이미지 정보 : 96 x 96 픽셀의 png 파일 묶음.
struct Sprites: Codable {
    let backDefault: String?
    let frontDefault: String
    let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}


// MARK: - TypeElement

struct PokemonType: Codable {
    let slot: Int
    let type: TypeDetail
}

// MARK: - Pokemon

struct TypeDetail: Codable {
    let name: String
    let url: String
}
