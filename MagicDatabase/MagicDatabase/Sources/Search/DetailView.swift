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
    
    var imageSize: CGSize = .zero
    var supaViewFrame: CGRect = .zero
    
    
    var frameHeight: CGFloat = 0
    var frameWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeUp.direction = .up
        self.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        swipeDown.direction = .down
        self.addGestureRecognizer(swipeDown)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.up {
            print("Swipe Up")
            reduceImageView()
            
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.down {
            print("Swipe Down")
            setOriginImageView()
        }
    }
    
    func setupView(imageSize: CGSize, supaViewFrame: CGRect) {
        
        
        frameHeight = supaViewFrame.height
        frameWidth = supaViewFrame.width
        
        self.supaViewFrame = supaViewFrame
        self.imageSize = imageSize
        
        addSubview(cardImg)
        cardImg.image = UIImage(named: "card_back")
        cardImg.contentMode = .scaleToFill
        cardImg.translatesAutoresizingMaskIntoConstraints = false
        cardImg.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        cardImg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardImg.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true
        cardImg.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true
        setOriginImageView()
        
        addSubview(expandView)
        expandView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        expandView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: CGSize(width: frameWidth, height: frameHeight * 0.08))
        
        
//        let expandViewHeight =
        
        expandView.addSubview(arrowView)
        arrowView.image = UIImage(named: "chevron_haut")
        arrowView.contentMode = .scaleToFill
        arrowView.translatesAutoresizingMaskIntoConstraints = false
//        arrowView.topAnchor.constraint(equalTo: expandView.topAnchor).isActive = true
//        arrowView.bottomAnchor.constraint(equalTo: expandView.bottomAnchor).isActive = true
        arrowView.centerXAnchor.constraint(equalTo: expandView.centerXAnchor).isActive = true
        arrowView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        arrowView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        addSubview(tableView)
        tableView.anchor(top: expandView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: frame.width, height: supaViewFrame.height * 0.4))
        tableView.backgroundColor = UIColor.red
        
    }
    
    func flipCard(image: UIImage) {
        cardImg.image = image
        UIView.transition(with: cardImg, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    
    func setOriginImageView(){
        
        
        self.cardImg.widthAnchor.constraint(equalToConstant: self.imageSize.width * 0.65).isActive = false
        self.cardImg.heightAnchor.constraint(equalToConstant: self.imageSize.height * 0.65).isActive = false
        
        self.cardImg.widthAnchor.constraint(equalToConstant: self.imageSize.width).isActive = true
        self.cardImg.heightAnchor.constraint(equalToConstant: self.imageSize.height).isActive = true
        
        UIView.animate(withDuration: 0.5) {
            
            self.layoutIfNeeded()
        }
        
    }
    func reduceImageView(){
        
        
        cardImg.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = false
        cardImg.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = false
        
        self.cardImg.widthAnchor.constraint(equalToConstant: self.imageSize.width * 0.65).isActive = true
        self.cardImg.heightAnchor.constraint(equalToConstant: self.imageSize.height * 0.65).isActive = true
        
        UIView.animate(withDuration: 0.5) {
            
            self.layoutIfNeeded()
        }
        
    }
    
    func showTableView() {
        expandView.anchor(top: cardImg.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: frameWidth, height: frameHeight * 0.05))
        
        UIView.animate(withDuration: 0.5) {
            
            self.layoutIfNeeded()
        }

    }
}
