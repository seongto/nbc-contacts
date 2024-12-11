//
//  ContactContentViewDelegate.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/11/24.
//

import Foundation

protocol ContactContentViewDelegate: AnyObject {

    /// 사용자가 포켓몬 버튼 눌렀을 때 호출
    func tapRequestButton() async -> PokemonResponse
}
