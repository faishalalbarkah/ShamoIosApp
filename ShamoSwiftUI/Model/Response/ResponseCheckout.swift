//
//  ResponseCheckout.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 20/12/22.
//

import Foundation
import SwiftyJSON


struct ResponseCheckoutModel: Codable {
    let meta: Meta?
    let data: DataCheckout?
}

// MARK: - DataClass
struct DataCheckout: Codable {
    let users_id, total_price_, shipping_price, id: Int
    let address, status, created_at, updated_at: String
    let items: [ItemCheckout]
}

struct ItemCheckout: Codable {
    let id, users_id, products_id, quantity: Int
    let created_at, updated_at: String
    let product: DataProductCheckout
}

struct DataProductCheckout: Codable {
    let id: Int
    let name: String
    let price: Int
    let description: String
    let tags: String
    let categories_id: Int
    let deleted_at: String
    let created_at: String
    let updated_at: String
}
