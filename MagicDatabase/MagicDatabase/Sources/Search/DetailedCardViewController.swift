//
//  DetailedCardViewController.swift
//  MagicDatabase
//
//  Created by Eric DkL on 27/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import UIKit

class DetailedCardViewController: UIViewController {

    let detailView = DetailView()
    
    let network = Network()
    let imageFetcher = ImageFetcher(dataFetcher: ImageDataFetcher())
    
    var cardId: String?
    var cardName: String?
    var cardImageUrl: String?
    
    var card: DetailedCardResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupUI()

        guard let id = cardId else { return }
        let query = Query(method: .get, baseURL: BaseURL.mtg, path: "v1/cards/\(id)", queryItems: nil, parameters: nil, securityKey: nil)
        network.request(query: query) { (dCardResponse: DetailedCardResponse) in
            
            if let urlString = self.cardImageUrl, let url = URL(string: urlString){
                
                self.imageFetcher.getImage(from: url, completionHandler: { (image) in
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                        self.detailView.flipCard(image: image)
                    })
                })
            }
            
            
        }
        
        
    }
  
    func setupUI(){
        if let cardName = cardName {
            title = cardName
        } else {
            title = "Card Details"
        }
        view.backgroundColor = .white
        
        view.addSubview(detailView)
        detailView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        let imageWidth = view.frame.width * 0.9
        let imageHeight = imageWidth + imageWidth * 0.5
        let imageSize = CGSize(width: imageWidth, height: imageHeight)
        detailView.setupView(imageSize: imageSize)
    }

    deinit {
        print("deinit success")
    }
}
