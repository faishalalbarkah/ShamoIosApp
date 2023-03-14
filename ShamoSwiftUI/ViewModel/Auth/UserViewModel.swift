//
//  UserViewModel.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 09/12/22.
//

import Foundation
import Alamofire

class UserViewModel: ObservableObject {
    init() {
        getUser()
    }
    @Published var itemUser: User?
    func getUser() {
        guard let token = UserDefaults.standard.object(forKey: "access_token") else {
                    return
                }

                let headers: HTTPHeaders = [
                    .authorization(bearerToken: token as! String),
                    ]
        
        AF.request(UrlUser, method: .get, headers: headers).responseDecodable(of: ResponseModelUser.self) { response in
            switch response.result {
            case .success:
                let response = try? JSONDecoder().decode(ResponseModelUser.self, from: response.data!)
//                print("Response Users = \(response?.data.username)")
                self.itemUser = response?.data
            case .failure:
                print("Response Error => \(response.error)")
            }
        }.resume()
    }
}
