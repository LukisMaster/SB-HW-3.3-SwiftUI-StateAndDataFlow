//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Sergey Nestroyniy on 04.11.2022.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func saveUserData (user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUserData () -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else {return User()}
        return user
    }
    
    func clearUserData (userManager: UserManager) {
        userManager.clear()
        userData = nil
    }
}
