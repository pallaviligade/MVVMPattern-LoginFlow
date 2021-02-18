//
//  ViewController.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 10/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var UserTextFeild: UITextField!
    @IBOutlet weak var PasswordTextFeild: UITextField!
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.delegate = self
        self.UserTextFeild.reloadInputViews()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapLoginButton(_ sender: Any)
    {
     
        UserTextFeild.text = "pallavi0204@gmail.com"
        PasswordTextFeild.text = "1234"
        let request = LoginRequest(userEmail:UserTextFeild.text!, userPassword: PasswordTextFeild.text!)
        loginViewModel.LoginUser(Request: request)
    }
}

