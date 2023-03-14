//
//  ResponseCategory.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import SwiftyJSON

struct ResponseCategorys: Codable {
    let meta: Meta?
    let data: DataCategorys
}

struct DataCategorys: Codable {
    let current_page: Int?
    let data: [DataCategory]
}

struct DataCategory: Codable {
    let id: Int
    let name: String
}
