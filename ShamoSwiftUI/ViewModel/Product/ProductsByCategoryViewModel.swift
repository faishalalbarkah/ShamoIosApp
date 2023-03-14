//
//  ProductsByCategory.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import Alamofire

class ProductsByCategoryViewModel:ObservableObject {
//    init(){
//        getProductByCategory(categories: 1)
//    }
    @Published var itemsProductsCategory:DataProducts?
    func getProductByCategory(categories: Int) {
        
        AF.request("http://127.0.0.1:8000/api/products?categories=\(categories)", method: .get).responseDecodable(of: ResponseProducts.self) { response
            in
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseProducts.self, from: response.data!)
//                print("Response Product By Categories = \(response?.data?.data)")
                self.itemsProductsCategory = response?.data
            case .failure:
                print("Response Error => \(response.error)")
            }
        }.resume()
    }
}
