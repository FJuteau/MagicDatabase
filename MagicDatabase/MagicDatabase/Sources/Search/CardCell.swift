//
//  CardCell.swift
//  MagicDatabase
//
//  Created by Eric DkL on 25/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell{

    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        addSubview(imageView)
        imageView.fillSuperview()
        imageView.image = UIImage(named: "card_back")
        imageView.contentMode = .scaleToFill
        
    }
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width * 0.07
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 5
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
