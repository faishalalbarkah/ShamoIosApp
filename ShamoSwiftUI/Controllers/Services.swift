//
//  Services.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 08/11/22.
//

import Foundation
import SwiftyJSON
import Alamofire

let urlCategorys = "http://127.0.0.1:8000/api/categories";
let urlProductPopular = "http://127.0.0.1:8000/api/products?tags=Popular"
let UrlRegis = "http://127.0.0.1:8000/api/register";
let UrlLogin = "http://127.0.0.1:8000/api/login"
let UrlUser = "http://127.0.0.1:8000/api/user"


// MARK: - ResponseModel
//struct ResponseModel: Codable {
//    let meta: Meta?
//    let data: DataClass?
//}

//// MARK: - DataClass
//struct DataClass: Codable {
//    let accessToken, tokenType: String?
//    let user: User?
//    
//    init() {
//        accessToken = nil
//        tokenType = nil
//        user = nil
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case accessToken = "access_token"
//        case tokenType = "token_type"
//        case user
//    }
//}
//
//struct ResponseModelUser: Codable {
//    let meta: Meta?
//    let data: User
//}

//// MARK: - User
//struct User: Codable {
//    let id: Int?
//    let name, email, username, roles: String?
//    let emailVerifiedAt, currentTeamID, profilePhotoPath: String?
//    let createdAt, updatedAt: String?
//    let profilePhotoURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, email, username, roles
//        case emailVerifiedAt = "email_verified_at"
//        case currentTeamID = "current_team_id"
//        case profilePhotoPath = "profile_photo_path"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case profilePhotoURL = "profile_photo_url"
//    }
//}
////End Model Users

//struct ResponseCategorys: Codable {
//    let meta: Meta?
//    let data: DataCategorys
//}



//End Model Categorys





//End Products

//Mark: - ErrorMessage
struct ErrorMessage: Codable {
    let message: String
    let error: Error
    
}

// MARK: - Error
struct Error: Codable {
    let status: Int
}

// MARK: - Meta
//struct Meta: Codable {
//    let code: Int?
//    let status, message: String?
//}

//Model Register
struct ModelRegister: Decodable {
    let name: String
    let username: String
    let email: String
    let password: String
}

//Model Login
struct ModelLogin: Decodable {
    let email: String
    let password: String
}

//View Model Categorys
class ViewModels: ObservableObject {
    
//    init() {
////        getCategorys()
////        getProductsPopular()
////        getProductByCategory(categories: 1)
//        getUser()
//    }
    
//    @Published var items: DataCategorys?
//    @Published var itemsProductsPopular:DataProducts?
//    @Published var itemsProductsCategory:DataProducts?
//    @Published var itemDataProduk: DataProductByID?
//    @Published var itemUser: User?
    
//    @Published var resMessage: DataClass = DataClass()
//    @Published var resError: Any = {}
    
//    func getUser() {
//        guard let token = UserDefaults.standard.object(forKey: "access_token") else {
//                    return
//                }
//
//                let headers: HTTPHeaders = [
//                    .authorization(bearerToken: token as! String),
//                    ]
//
//        AF.request(UrlUser, method: .get, headers: headers).responseDecodable(of: ResponseModelUser.self) { response in
//            switch response.result {
//            case .success:
//                let response = try? JSONDecoder().decode(ResponseModelUser.self, from: response.data!)
////                print("Response Users = \(response?.data.username)")
//                self.itemUser = response?.data
//            case .failure:
//                print("Response Error => \(response.error)")
//            }
//        }.resume()
//    }
    
//    func getCategorys() {
//        
//        AF.request(urlCategorys, method: .get).responseDecodable(of: ResponseCategorys.self) { response in
//            switch response.result {
//            case .success:
//                let response = try? JSONDecoder().decode(ResponseCategorys.self, from: response.data!)
////                print("Response Categorys = \(response)")
//                self.items = response?.data
//            case .failure:
//                print("Response Error => \(response.error)")
//            }
//        }.resume()
//    }
    
//    func getProductsPopular() {
//        
//        AF.request(urlProductPopular, method: .get).responseDecodable(of: ResponseProducts.self) { response in
//            switch response.result {
//            case .success:
//                let response = try? JSONDecoder().decode(ResponseProducts.self, from: response.data!)
////                print("Response Product = \(response?.data)")
//                self.itemsProductsPopular = response?.data
//            case .failure:
//                print("Response Error => \(response.error)")
//            }
//        }.resume()
//    }
    
//    func getProductByCategory(categories: Int) {
//        
//        AF.request("http://127.0.0.1:8000/api/products?categories=\(categories)", method: .get).responseDecodable(of: ResponseProducts.self) { response
//            in
//            switch response.result {
//            case .success:
//                let response = try? JSONDecoder().decode(ResponseProducts.self, from: response.data!)
////                print("Response Product By Categories = \(response?.data?.data?.count)")
//                self.itemsProductsCategory = response?.data
//            case .failure:
//                print("Response Error => \(response.error)")
//            }
//        }.resume()
//    }
    
//    func getProductById(id: Int) {
//        
//        AF.request("http://127.0.0.1:8000/api/products?id=\(id)", method: .get).responseDecodable(of: ResponseProductByID.self) { response
//            in
//            switch response.result {
//            case .success:
//                let response = try? JSONDecoder().decode(ResponseProductByID.self, from: response.data!)
//                print("Response Product By ID = \(response?.data)")
//                self.itemDataProduk = response?.data
//            case .failure:
//                print("Response Error => \(response.error)")
//            }
//        }.resume()
//    }
    
    
//    func register(name :String, username:String, email: String, password: String, callback: @escaping (DataClass)->()) {
//        guard let url = URL(string: UrlRegis) else {return}
//
//        let body: [String: Any] = ["name": name, "username": username, "email": email, "password": password]
//
//        let finalData = try! JSONSerialization.data(withJSONObject: body)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = finalData
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        AF.request(UrlRegis, method: .post,parameters: body).responseDecodable(of: ResponseModel.self) { response in
//
//            switch response.result {
//            case .success:
//                let response = try? JSONDecoder().decode(ResponseModel.self, from: response.data!)
//                UserDefaults.standard.set(response?.data?.accessToken, forKey: "access_token")
////                print("response -> \(response?.meta?.message)")
//                self.resMessage = (response?.data)!
//                callback((response?.data!)!)
//
//
//            case .failure:
//                print("Response Error => \(response.error)")
//                self.resError = (response.error)
//            }
//        }.resume()
//    }
//
//    func login(email :String, password:String, callback: @escaping (DataClass)->()) {
//        guard let url = URL(string: UrlLogin) else {return}
//
//        let body: [String: Any] = ["email": email, "password": password]
//        print("Chek => \(body)")
//        let finalData = try! JSONSerialization.data(withJSONObject: body)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = finalData
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        AF.request(UrlLogin, method: .post,parameters: body).responseDecodable(of: ResponseModel.self) { response in
//
//            switch response.result {
//            case .success:
//                let response = try? JSONDecoder().decode(ResponseModel.self, from: response.data!)
//                UserDefaults.standard.set(response?.data?.accessToken, forKey: "access_token")
//                print("response -> \(response?.meta?.message)")
//                self.resMessage = (response?.data)!
//                callback((response?.data!)!)
//
//
//            case .failure:
//                print("Response Error => \(response.error)")
//                self.resError = (response.error)
//            }
//        }.resume()
//    }
}
