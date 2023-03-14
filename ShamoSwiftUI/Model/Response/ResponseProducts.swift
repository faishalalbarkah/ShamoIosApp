//
//  ResponseProducts.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import SwiftyJSON

struct ResponseProducts: Codable {
    let meta: Meta?
    let data: DataProducts?
}

struct DataProducts: Codable {
    let current_page: Int?
    let data: [DataProduct]?
    let first_page_url: String?
    let from: Int?
    let last_page: Int?
    let last_page_url: String?
    let per_page: Int?
}

struct DataProduct: Codable {
    let id: Int
    let name: String
    let price: Int
    let description: String
    let tags: String
    let categories_id: Int
    let category: DataCategory
    var galleries: [DataGalleries]
}

struct DataGalleries: Codable {
    let id: Int
    let products_id: Int
    let url: String
}
