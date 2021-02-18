//
//  LoginExtension.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 12/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
import UIKit
extension LoginViewController : LoginViewModelDelagte
{
    func didReciveLoginReposnse(LoginReponse: LoginResponse) {
           if LoginReponse.error == nil && LoginReponse.data != nil {
              
            let vc = self.storyboard?.instantiateViewController(withIdentifier:"EmployeeID") as! EmployeeViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
           }else if (LoginReponse.error != nil)
           {
               let alert = UIAlertController (title: "", message: "Wrong", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Action", style: .default, handler: nil))
               self.present(alert, animated: false, completion: nil)
               
           }
          }
}
