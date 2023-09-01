//
//  Categories.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Foundation
// MARK: - CategoryResult
struct CategoryResult: Codable {
    var сategories: [Сategories]
}

// MARK: - Сategory
struct Сategories: Codable, Identifiable {
    let id: Int?
    let name: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}
