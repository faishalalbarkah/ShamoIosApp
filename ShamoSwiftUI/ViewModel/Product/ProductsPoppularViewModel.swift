//
//  ProductsPoppularViewModel.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import Alamofire

class ProductsPoppularViewModel:ObservableObject {
//    init() {
//        getProductsPopular()
//    }
    
    @Published var itemsProductsPopular:DataProducts?
    
    func getProductsPopular() {
        
        AF.request(urlProductPopular, method: .get).responseDecodable(of: ResponseProducts.self) { response in
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseProducts.self, from: response.data!)
//                print("Response Product = \(response?.data)")
                self.itemsProductsPopular = response?.data
            case .failure:
                print("Response Error => \(response.error)")
            }
        }.resume()
    }
}
