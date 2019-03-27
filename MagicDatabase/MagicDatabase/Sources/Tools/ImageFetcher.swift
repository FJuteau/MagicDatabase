//
//  ImageFetcher.swift
//  MagicDatabase
//
//  Created by François Juteau on 26/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import UIKit

final class ImageFetcher {

    let dataFetcher: DataFetcherProtocol
    
    init(dataFetcher: DataFetcherProtocol) {
        self.dataFetcher = dataFetcher
    }
    
    /// Fetch Image from network
    ///
    /// - Parameters:
    ///   - url: url fron where to get the image
    ///   - completionHandler: returns a placeholder image while loading, then returns the fetched image
    func getImage(from url: URL, completionHandler: ((UIImage) -> Void)) {

        dataFetcher.fetchData(from: url) { data in
            guard let image = UIImage(data: data) else { return }
            
            completionHandler(image)
        }
    }
}

protocol DataFetcherProtocol {
    func fetchData(from url: URL, completionHandler: ((Data) -> Void))
}

final class ImageDataFetcher: DataFetcherProtocol {
    func fetchData(from url: URL, completionHandler: ((Data) -> Void)) {
        do {
            let data = try Data(contentsOf: url)
            
            completionHandler(data)
        } catch {
            print("no data")
        }
    }
}
