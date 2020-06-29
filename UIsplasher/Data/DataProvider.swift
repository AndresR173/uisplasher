//
//  DataProvider.swift
//  UIsplasher
//
//  Created by Andres Rojas on 29/06/20.
//

import Combine
import Foundation

struct DataProvider {    
    func run(_ path: String) -> AnyPublisher<Data, Error> {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.Api.scheme
        urlComponents.host = Constants.Api.host
        urlComponents.path = path
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: Secrects.ACCESS_KEY)]
        guard let url = urlComponents.url else {
            return Fail(error: NetworkErrors.badRequest).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .mapError { NetworkErrors.badContent(error: $0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum NetworkErrors: Error {
    case badRequest
    case badContent(error: Error)
}
