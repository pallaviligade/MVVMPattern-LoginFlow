//
//  LoginValidation.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 12/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
struct ValidationResult {
    let Sucess:Bool
    let error:String?
}

@propertyWrapper
struct  EmailPropertyWrapper {
    private var _value : String
    var wrappedValue : String{
        get {
            return checkEmailIDValidation(emailID: _value) ? _value : String()
        }
        set {
            _value = newValue
        }
    }
    
    init(emaild:String) {
        _value = emaild
    }
    private func checkEmailIDValidation(emailID:String) -> Bool
    {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: emailID)
    }

    
}

struct LoginValidation{
   @EmailPropertyWrapper var email : String
    var password : String
    
    func CheckUser(LoginRequest:LoginRequest) -> ValidationResult
    {
        return  LoginValidation(LoginRequest: LoginRequest)
        
    }
 private func LoginValidation(LoginRequest:LoginRequest) ->  ValidationResult {
        
        
        if (LoginRequest.userPassword.isEmpty) {
            return ValidationResult(Sucess: false, error: "isEmpty")
        }
      
        else if (email.isEmpty || email == ""){
            return ValidationResult(Sucess: false, error: "Not a valid")

    }
        
        return ValidationResult(Sucess: true, error: "Good")
}
}


