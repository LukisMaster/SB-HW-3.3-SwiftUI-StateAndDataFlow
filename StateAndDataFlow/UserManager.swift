//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Sergey Nestroyniy on 04.11.2022.
//

import Combine

class UserManager: ObservableObject {
    @Published var user = User()
    
    var countName: Int {
        user.name.count
    }
    
    var nameIsValid: Bool {
        countName >= 3
    }
    
    init () {}
    
    init (user: User) {
        self.user = user
    }
    
    func clear () {
        user = User()
    }
}
