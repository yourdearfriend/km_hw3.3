//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import Combine
import Foundation

class UserManager: ObservableObject {
    @Published var isRegister = getUserStatus()
    
    var name = getUserName()
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}

extension UserManager {
    func saveUser() {
        if isRegister == true {
            UserDefaults.standard.set(isRegister, forKey: "RegistrationStatus")
            UserDefaults.standard.set(name, forKey: "UserName")
        }
    }
    
    static func getUserStatus() -> Bool {
        let userStatus = UserDefaults.standard.value(forKey: "RegistrationStatus") as? Bool ?? false
        return userStatus
    }
    
    static func getUserName() -> String {
        let userName = UserDefaults.standard.value(forKey: "UserName") as? String ?? ""
        return userName
    }
    
    func removeUser() {
        isRegister = false
        name = ""
        
        UserDefaults.standard.set(false, forKey: "RegistrationStatus")
        UserDefaults.standard.set("", forKey: "UserName")
        print("removeUser")
    }
}
