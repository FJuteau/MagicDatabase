//
//  ImageFetcherTests.swift
//  MagicDatabaseTests
//
//  Created by Eric DkL on 26/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import XCTest
import UIKit
@testable import MagicDatabase

class ImageFetcherTests: XCTestCase {

    func test_GIVEN_Url_WHEN_FetchingImage_THEN_ItReturnsImage() {
        let imageFetcher = ImageFetcher(dataFetcher: MockDataFetcher())
        
        let inputURL = URL(string: "http://lol.com")!
        let resultImage = UIImage(named: "magicMesh")!
        let resultImageData = resultImage.pngData()
        
        let expectation = self.expectation(description: "OK")
        
        imageFetcher.getImage(from: inputURL) { image in
            XCTAssertEqual(resultImageData, image.pngData())
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 1)
    }

}

final class MockDataFetcher: DataFetcherProtocol {
    func fetchData(from url: URL, completionHandler: ((Data) -> Void)) {
        if url.absoluteString == "http://lol.com" {
            let resultImage = UIImage(named: "magicMesh")!
            completionHandler(resultImage.pngData()!)
        }
    }
}
