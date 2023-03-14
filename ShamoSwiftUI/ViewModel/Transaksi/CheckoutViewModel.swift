//
//  CheckoutViewModel.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 20/12/22.
//

import Foundation
import Alamofire


//View Model Categorys
class CheckoutViewModel: ObservableObject {
    
//    @Published var resMessage: DataCheckout = DataCheckout()
    @Published var resError: Any = {}
    
    func Checkout(address :String, items:AnyObject, status: String, total_price: Int, shipping_price: Int) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/checkout") else {return}
        
        let body: [String: Any] = ["address": address, "items": items, "status":status, "total_price":total_price, "shipping_price":shipping_price]
        print("Chek => \(body)")
        let finalData = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request("http://127.0.0.1:8000/api/checkout", method: .post,parameters: body).responseDecodable(of: ResponseCheckoutModel.self) { response in
            
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseCheckoutModel.self, from: response.data!)
//                UserDefaults.standard.set(response?.data?.accessToken, forKey: "access_token")
                print("response -> \(response?.meta?.message)")
//                self.resMessage = (response?.data)!
//                callback((response?.data!)!)


            case .failure:
                print("Response Error => \(response.error)")
                self.resError = (response.error)
            }
        }.resume()
    }
}
