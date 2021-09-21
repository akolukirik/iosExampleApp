//
//  ProductModelResponse.swift
//  deneme
//
//  Created by Ismail Kilic on 21.09.2021.
//

import Foundation

// MARK: - WelcomeElement
struct ProductModelResponse: Codable {
    let id, maker: String?
    let img: String?
    let url: String?
    let title, welcomeDescription: String?
    let ratings: [Int]?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case maker = "Maker"
        case img
        case url = "Url"
        case title = "Title"
        case welcomeDescription = "Description"
        case ratings = "Ratings"
    }
}

