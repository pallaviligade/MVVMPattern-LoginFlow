//
//  EmployeeDataResourceFile.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
struct EmployeeDataResourceFile {
    
    func getEmployeeData(employeeRequest:EmployeeRequest,complicationHandler:@escaping(_ result:EmployeeResponse?) -> Void)
       {
        let httpFile = HttpUtility ()
        let apiendpoint = "\(ApiEndPoint.employees1)?Department=\(employeeRequest.department)&UserId=\(employeeRequest.UserID)"
        let requestURL = URL(string: apiendpoint)!
        httpFile.getApiData(RequestUrl: requestURL, ResultType: EmployeeResponse.self) { (employeeapiResponse) in
            complicationHandler(employeeapiResponse)
        }
    }
}

