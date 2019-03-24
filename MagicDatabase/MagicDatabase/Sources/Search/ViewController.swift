//
//  ViewController.swift
//  MagicDatabase
//
//  Created by François Juteau on 24/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    let network = Network()
    let cellId = "cellId"
    var cards = [CardsResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        let query = Query(method: .get, baseURL: BaseURL.mtg, path: "v1/cards", queryItems: nil, parameters: nil, securityKey: nil)
        
        network.request(query: query) { (cardsResponse: CardsBaseReponse) in
            print("cardsResponse \(cardsResponse)")
            cardsResponse.cards.forEach({ (card) in
                self.cards.append(card)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
        }
        
    }


    func setupUI() {
        
        view.backgroundColor = .white
        collectionView.fillSuperview()
        collectionView.backgroundColor = .clear
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CardCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = view.frame.width * 0.1
        let interSpacing = view.frame.width * 0.05
        var cellWidth: CGFloat = 0
        var cellHeight: CGFloat = 0
        if UIDevice.current.orientation.isLandscape {
            cellWidth = (view.frame.width - 2 * padding - 2 * interSpacing) / 3
            cellHeight = view.frame.height * 0.8
        } else if UIDevice.current.orientation.isPortrait {
            cellWidth = (view.frame.width - 2 * padding - 2 * interSpacing) / 2
            cellHeight = (view.frame.height - 2 * padding - 2 * interSpacing) / 3
        }
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let leftRightpadding = view.frame.width * 0.1
        let topBottomPadding = view.frame.height * 0.1
        
        return UIEdgeInsets(top: topBottomPadding, left: leftRightpadding, bottom: topBottomPadding, right: leftRightpadding)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.height * 0.05
    }
}

