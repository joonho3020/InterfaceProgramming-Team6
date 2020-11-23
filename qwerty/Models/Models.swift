//
//  Models.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/11/23.
//

import Foundation


/// Image data / information retrieved from the unsplash api.
struct Photo: Codable, Identifiable, Hashable {

    let id: String
//    let createdAt: String
//    let likes: Int
//    let width: Int
//    let height: Int
//    let color: String // Hex color value
//    let description: String?
//    let altDescription: String?
    let urls: Sizes

    struct Sizes: Codable, Hashable {
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }
}

struct Response: Codable, Equatable {
    let total: Int
    let total_pages: Int
    let results: [Photo]
}
