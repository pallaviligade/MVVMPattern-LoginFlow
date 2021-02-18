//
//  EmployeeResponse.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//



struct EmployeeResponse : Decodable
{
    let errorMessage: String?
    let data: [Employee]?
}

struct Employee: Decodable {
    let name, email, id: String
    let joining: String

    enum CodingKeys: String, CodingKey {
        case name, email, id, joining
    }
}
