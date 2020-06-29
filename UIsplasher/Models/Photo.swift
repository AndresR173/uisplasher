//
//  Photo.swift
//  UIsplasher
//
//  Created by Andres Rojas on 29/06/20.
//

import Foundation

struct Photo: Codable {
    let id: String
    let width: Int
    let height: Int
    let downloads: Int
    let likes: Int
    let description: String
    let location: Location
    let urls: URLS
}

struct Location: Codable {
    let city: String
    let country: String
}

struct URLS: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}
