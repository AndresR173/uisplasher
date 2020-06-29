//
//  UnsplashAPI.swift
//  UIsplasher
//
//  Created by Andres Rojas on 29/06/20.
//

import Combine
import Foundation

enum UnsplashAPI {
    static let provider = DataProvider()
    static let path = "/photos"
}

extension UnsplashAPI {
    static func photos() -> AnyPublisher<[Photo], Error> {

        return provider.run(path)
            .map { $0 }
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
