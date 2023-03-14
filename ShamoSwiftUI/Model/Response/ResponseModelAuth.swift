//
//  ResponseModel.swift
//  ShamoSwiftUI
//
//  Created by faisalalbarkah on 30/11/22.
//

import Foundation
import SwiftyJSON

struct ResponseModel: Codable {
    let meta: Meta?
    let data: DataClass?
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int?
    let status, message: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let accessToken, tokenType: String?
    let user: User?
    
    init() {
        accessToken = nil
        tokenType = nil
        user = nil
    }

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case user
    }
}

struct User: Codable {
    let id: Int?
    let name, email, username, roles: String?
    let emailVerifiedAt, currentTeamID, profilePhotoPath: String?
    let createdAt, updatedAt: String?
    let profilePhotoURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, username, roles
        case emailVerifiedAt = "email_verified_at"
        case currentTeamID = "current_team_id"
        case profilePhotoPath = "profile_photo_path"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case profilePhotoURL = "profile_photo_url"
    }
}
//End Model Users

struct ResponseModelUser: Codable {
    let meta: Meta?
    let data: User
}
