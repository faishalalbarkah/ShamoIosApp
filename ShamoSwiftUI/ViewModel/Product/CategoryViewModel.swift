//
//  CategoryViewModel.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import SwiftyJSON
import Alamofire

class CategoryViewModel:ObservableObject {
//    init() {
//        getCategorys()
//    }
    
    @Published var items: DataCategorys?
    
    func getCategorys() {
        
        AF.request(urlCategorys, method: .get).responseDecodable(of: ResponseCategorys.self) { response in
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseCategorys.self, from: response.data!)
//                print("Response Categorys = \(response)")
                self.items = response?.data
            case .failure:
                print("Response Error => \(response.error)")
            }
        }.resume()
    }
}
