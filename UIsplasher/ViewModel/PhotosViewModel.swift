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

    func getPhotos() {
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
    }
    
}
