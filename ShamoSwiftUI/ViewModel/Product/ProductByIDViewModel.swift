//
//  ProductByIDViewModel.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import Alamofire

class ProductByIDViewModel: ObservableObject{
    
    @Published var itemDataProduk: DataProductByID?
    
    func getProductById(id: Int) {
        print("Get ID ViewModel \(id)")
        AF.request("http://127.0.0.1:8000/api/products?id=\(id)", method: .get).responseDecodable(of: ResponseProductByID.self) { response
            in
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseProductByID.self, from: response.data!)
//                print("Response Product By ID = \(response?.data)")
                self.itemDataProduk = response?.data
            case .failure:
                print("Response Error => \(response.error)")
            }
        }.resume()
    }
}
