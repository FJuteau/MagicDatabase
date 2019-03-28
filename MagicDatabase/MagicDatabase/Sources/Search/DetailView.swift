//
//  DetailScrollView.swift
//  MagicDatabase
//
//  Created by Eric DkL on 27/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import UIKit

class DetailView: UIView {

    let cardImg = UIImageView()
    let expandView = UIView()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(imageSize: CGSize) {
        
        addSubview(cardImg)
        cardImg.image = UIImage(named: "card_back")
        cardImg.contentMode = .scaleToFill
        cardImg.translatesAutoresizingMaskIntoConstraints = false
        cardImg.topAnchor.constraint(equalTo: topAnchor, constant: 85).isActive = true
        cardImg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardImg.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true
        cardImg.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true
        
        addSubview(expandView)
        expandView.backgroundColor = UIColor.lightGray
        expandView.anchor(top: cardImg.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
//        addSubview(tableView)
//        tableView.anchor(top: cardImg.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 200))
//        tableView.backgroundColor = UIColor.red
        
    }
    
    func flipCard(image: UIImage) {
        cardImg.image = image
        UIView.transition(with: cardImg, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    
    
}
