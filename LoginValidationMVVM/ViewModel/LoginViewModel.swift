//
//  LoginViewModel.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 11/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation

protocol LoginViewModelDelagte {
    func didReciveLoginReposnse(LoginReponse:LoginResponse) -> Void
}

struct LoginViewModel {
    var delegate : LoginViewModelDelagte?
    func LoginUser(Request:LoginRequest) -> Void
    {
        
        let loginvalidation = LoginValidation(email: EmailPropertyWrapper(emaild: Request.userEmail), password:  Request.userPassword)
     let isSucessorfailed  = loginvalidation.CheckUser(LoginRequest: Request)
        if (isSucessorfailed.Sucess == true){
        let logindata = LoginDataResource ()
        logindata.LoginApi(loginRequest: Request) { (responseApiResponse) in
            DispatchQueue.main.async {
                if (responseApiResponse.data != nil && responseApiResponse.error == nil){
                UserDefaultUtitlty().saveUserID(UserID: responseApiResponse.data!.userID)
                    self.delegate?.didReciveLoginReposnse(LoginReponse:responseApiResponse)}
            }
        }
        }else{
            DispatchQueue.main.async {
               // self.delegate?.didReciveLoginReposnse(LoginReponse: LoginResponse(error: ValidationResult.error, data: nil))

                self.delegate?.didReciveLoginReposnse(LoginReponse: LoginResponse(error: "Validation Failed", data: nil))
            }
        }
        
        
    }
}


