//
//  RegisterViewModel.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import Alamofire


class RegisterViewModel: ObservableObject {
    
    @Published var resMessage: DataClass = DataClass()
    @Published var resError: Any = {}
    
    func register(name :String, username:String, email: String, password: String, callback: @escaping (DataClass)->()) {
        guard let url = URL(string: UrlRegis) else {return}
        
        let body: [String: Any] = ["name": name, "username": username, "email": email, "password": password]
        
        let finalData = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(UrlRegis, method: .post,parameters: body).responseDecodable(of: ResponseModel.self) { response in
            
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseModel.self, from: response.data!)
                UserDefaults.standard.set(response?.data?.accessToken, forKey: "access_token")
//                print("response -> \(response?.meta?.message)")
                self.resMessage = (response?.data)!
                callback((response?.data!)!)


            case .failure:
                print("Response Error => \(response.error)")
                self.resError = (response.error)
            }
        }.resume()
    }
}
