//
//  ResponseProductByID.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import SwiftyJSON


struct ResponseProductByID: Codable {
    let meta: Meta?
    let data: DataProductByID
}

struct DataProductByID: Codable {
    let id: Int?
    let name: String?
    let price: Int?
    let description: String?
    let tags: String?
    let categories_id: Int?
    let category: DataCategory?
    var galleries: [DataGalleries]?
    
    init() {
        id = nil
        name = nil
        price = nil
        description = nil
        tags = nil
        categories_id = nil
        category = nil
        galleries = nil
    }
}
