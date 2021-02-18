//
//  EmployeeRequest.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
@propertyWrapper
struct DepartmentPropertyWrapper {
    private var _value: String
    var wrappedValue: String
    {
        get
        {
            return _value == "0" ? "mobile" : "web"
        }
        set
        {
            _value = newValue
        }
    }

    init(_index: String) {
        _value = _index
    }
}
struct EmployeeRequest
{
    var UserID:Int
    @DepartmentPropertyWrapper var department: String
}
