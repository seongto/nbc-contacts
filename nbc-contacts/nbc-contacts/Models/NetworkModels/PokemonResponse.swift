//
//  PokemonResponse.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//


import Foundation

// MARK: - WelcomeMe

/// 다음의 포켓몬 API로부터 필요한 정보만 가져오기 : pokeapi.co/api/v2/pokemon/{id or name}/
public struct PokemonResponse: Codable {
    public let id: Int
    public let name: String
    public let sprites: Sprites
    public let types: [PokemonType]

}

// MARK: - sprites

/// 포켓몬의 이미지 정보 : 96 x 96 픽셀의 png 파일 묶음.
public struct Sprites: Codable {
    public let backDefault: String?
    public let frontDefault: String
    public let frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}


// MARK: - types

public struct PokemonType: Codable {
    public let slot: Int
    public let type: TypeDetail
}

// MARK: - type

public struct TypeDetail: Codable {
    public let name: String
    public let url: String
}
