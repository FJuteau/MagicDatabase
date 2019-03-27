//
//  DetailScrollView.swift
//  MagicDatabase
//
//  Created by Eric DkL on 27/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import UIKit

class DetailScrollView: UIScrollView {

    let cardImg = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView() {
        
        addSubview(cardImg)
        cardImg.image = UIImage(named: "card_back")
        cardImg.contentMode = .scaleToFill
        let value = frame.width / 4
        cardImg.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 40, left: value, bottom: 40, right: value))
        cardImg.heightAnchor.constraint(equalToConstant: value * 2)
    }
    
}
