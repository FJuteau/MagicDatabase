//
//  CardsResponse.swift
//  MagicDatabase
//
//  Created by Eric DkL on 24/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import Foundation

struct CardsBaseReponse: Codable {
    let cards: [CardsResponse]
}

struct CardsResponse: Codable {
    let name: String
    let imageUrl: String?
    let id: String
}
