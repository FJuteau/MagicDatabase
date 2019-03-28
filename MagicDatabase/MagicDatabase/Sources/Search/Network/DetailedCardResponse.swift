//
//  DetailedCardResponse.swift
//  MagicDatabase
//
//  Created by Eric DkL on 27/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import Foundation

struct DetailedCardResponse: Codable {
    let card: CardDetail
}
struct CardDetail: Codable {
    let name: String
    let imageUrl: String?
    let id: String
    let type: String?
    let manaCost: String?
    let rarity: String?
    let set: String?
    let setName: String?
    let number: String?
    let power: String?
    let toughness: String?
    let originalText: String?
    let legalities: [Legalities]
}

struct Legalities: Codable {
    let format: String?
    let legality: String?
}
