//
//  LoginResponse.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 11/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
struct LoginResponse: Decodable {
    var error: String?
    var data : LoginResponseData?
}

struct LoginResponseData : Decodable
{
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}
