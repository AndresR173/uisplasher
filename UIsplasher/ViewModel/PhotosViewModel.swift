//
//  PhotosViewModel.swift
//  UIsplasher
//
//  Created by Andres Rojas on 29/06/20.
//

import Foundation
import Combine

class PhotosViewModel: ObservableObject {
    @Published var photos = [Photo]()
    private var cancellables = Set<AnyCancellable>()
    let source: APISource

    init(source: APISource = .network) {
        self.source = source
    }

    enum APISource {
        case network
        case local
    }

    func getPhotos() {
        if source == .network {
            UnsplashAPI.photos()
                .eraseToAnyPublisher()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                    }
                }, receiveValue: { photos in
                    print("Photos count: ", photos.count)
                    self.photos = photos
                }).store(in: &cancellables)
        } else {
            guard let url = Bundle.main.url(forResource: "photos", withExtension: "json") else {
                return
            }

            do {
                let data = try Data(contentsOf: url)
                self.photos = try JSONDecoder().decode([Photo].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
}
