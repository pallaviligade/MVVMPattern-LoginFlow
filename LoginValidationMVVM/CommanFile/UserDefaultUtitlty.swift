//
//  UserDefaultUtitlty.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation

struct UserDefaultUtitlty {
    func saveUserID(UserID:Int) -> Void {
        UserDefaults.standard.set(UserID, forKey: "UserID")
    }
    func getUserID() ->Int {
        return UserDefaults.standard.value(forKey: "UserID") as! Int
    }
    
}
