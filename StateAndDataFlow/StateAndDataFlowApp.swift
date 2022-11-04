
import SwiftUI

@main
struct StateAndDataFlowApp: App {
    //v1
    @StateObject private var userManager = UserManager(user: DataManager.shared.fetchUserData())
    //v2 (witgout declaration @StateObject)
    //private let user = DataManager.shared.fetchUserData()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
            //v2
            //  .environmentObject(UserManager(user: user))

        }
    }
}
