//
//  Cards.swift
//  MagicDatabase
//
//  Created by Eric DkL on 25/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import Foundation

class Card  {
    
    let name: String
    let imageUrl: String?
    let id: String
    
    init(name: String, imageUrl: String?, id: String) {
        self.name = name
        self.imageUrl = imageUrl
        self.id = id
    }
}
