//
//  LoginDataResource.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 11/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation

struct  LoginDataResource{
    
    func LoginApi(loginRequest:LoginRequest,complicationHandler:@escaping(_ result:LoginResponse) -> Void){
        
        let loginUrl = URL(string: ApiEndPoint.login)!
        let httpUtility = HttpUtility ()

        print(loginRequest.self)
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.getPostData(RequestUrl: loginUrl, PostBody: loginPostBody, ResultType: LoginResponse.self) { (LoginResponseApi) in
                complicationHandler(LoginResponseApi!)
            }
            
        } catch let error
        {
            debugPrint(error.localizedDescription)
            
        }
       
        
        
    }
    
}
