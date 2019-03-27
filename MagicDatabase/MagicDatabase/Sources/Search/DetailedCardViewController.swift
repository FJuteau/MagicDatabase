//
//  DetailedCardViewController.swift
//  MagicDatabase
//
//  Created by Eric DkL on 27/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import UIKit

class DetailedCardViewController: UIViewController {

    let scrollView = DetailScrollView()
    
    let network = Network()
    
    var cardId: String?
    var card: DetailedCardResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let id = cardId else { return }
//        let query = Query(method: .get, baseURL: BaseURL.mtg, path: "v1/cards/\(id)", queryItems: nil, parameters: nil, securityKey: nil)
//        network.request(query: query) { (dCardResponse: DetailedCardResponse) in
//
//            self.setupUI(card: dCardResponse)
//        }
        
        
    }
  
    func setupUI(card: DetailedCardResponse){
        title = "Card Details"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        scrollView.contentSize = CGSize(width: 0, height: 1000)
//        let imageWidth = view.frame.width / 2
//        let imageHeight = imageWidth + imageWidth * 0.5
//        let imageSize = CGSize(width: imageWidth, height: imageHeight)
//        scrollView.setupScrollView(imageSize: imageSize)
    }

}
