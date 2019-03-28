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
    let arrowView = UIImageView()
    
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
        expandView.backgroundColor = #colorLiteral(red: 0.8004615933, green: 0.8661375993, blue: 0.8671364959, alpha: 1)
        expandView.anchor(top: cardImg.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        expandView.addSubview(arrowView)
        arrowView.backgroundColor = .blue
//        arrowView.image = UIImage(named: "expand_icon")
        arrowView.contentMode = .scaleToFill
        arrowView.translatesAutoresizingMaskIntoConstraints = false
//        arrowView.topAnchor.constraint(equalTo: expandView.topAnchor).isActive = true
        arrowView.bottomAnchor.constraint(equalTo: expandView.bottomAnchor).isActive = true
        arrowView.centerXAnchor.constraint(equalTo: expandView.centerXAnchor).isActive = true
        arrowView.widthAnchor.constraint(equalToConstant: expandView.frame.height).isActive = true
        arrowView.heightAnchor.constraint(equalToConstant: expandView.frame.height).isActive = true
        
        addSubview(tableView)
        tableView.anchor(top: expandView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: frame.width, height: 500))
        tableView.backgroundColor = UIColor.red
        
    }
    
    func flipCard(image: UIImage) {
        cardImg.image = image
        UIView.transition(with: cardImg, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    
    @objc func expandTapped() {
        // Some Awsom stuff here
    }
}
