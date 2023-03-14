//
//  APIService.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 30/11/22.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol ServiceProtocol {
    func login(email :String, password:String, callback: @escaping (DataClass)->())
}

class APIService: ServiceProtocol {
    private let urlLogin = "http://127.0.0.1:8000/api/login"
    
    @Published var resMessage: DataClass = DataClass()
    @Published var resError: Any = {}
    
    func login(email :String, password:String, callback: @escaping (DataClass)->()) {
        guard let url = URL(string: UrlLogin) else {return}
        
        let body: [String: Any] = ["email": email, "password": password]
        print("Chek => \(body)")
        let finalData = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(UrlLogin, method: .post,parameters: body).responseDecodable(of: ResponseModel.self) { response in
            
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseModel.self, from: response.data!)
                UserDefaults.standard.set(response?.data?.accessToken, forKey: "access_token")
                print("response -> \(response?.meta?.message)")
                self.resMessage = (response?.data)!
                callback((response?.data!)!)


            case .failure:
                print("Response Error => \(response.error)")
                self.resError = (response.error) 
            }
        }.resume()
    }
}
