//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Sergey Nestroyniy on 04.11.2022.
//

import Combine

class UserManager {
    @Published private(set) var user = User()
    
    var nameIsValid: Bool {
        user.name.count > 2
    }
    
    init () {}
    
    init (user: User) {
        self.user = user
    }
    
    func clear () {
        user = User()
    }
}
