//
//  EmployeeExtension.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
import UIKit

extension EmployeeViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeResponseData?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        cell.textLabel?.text = employeeResponseData?.data?[indexPath.row].name
        return cell
    }
    
    
}
