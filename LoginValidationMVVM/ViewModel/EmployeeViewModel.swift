//
//  EmployeeViewModel.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
struct EmployeeViewModel {
    func getEmpolyeeByDepartement(DepartmentIndex:Int,handler:@escaping(EmployeeResponse?)->Void)  {
        let userID = UserDefaultUtitlty().getUserID()
        let employeeRequest = EmployeeRequest(UserID: userID, department: DepartmentPropertyWrapper(_index: "\(DepartmentIndex)"))
// giving call to api data resource
        let employeeResource = EmployeeDataResourceFile()
        employeeResource.getEmployeeData(employeeRequest: employeeRequest) {
            (employeeapiResponse) in
           handler(employeeapiResponse)
        }
    }
}
