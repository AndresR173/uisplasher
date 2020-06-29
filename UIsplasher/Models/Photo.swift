//
//  Photo.swift
//  UIsplasher
//
//  Created by Andres Rojas on 29/06/20.
//

import Foundation

struct Photo: Codable, Identifiable, Equatable {
    let id: String
    let width: Int
    let height: Int
    let likes: Int
    let description: String?
    let urls: URLS
}

struct URLS: Codable, Equatable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
