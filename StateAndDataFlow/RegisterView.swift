

import SwiftUI

struct RegisterView: View {

    @EnvironmentObject var userManager: UserManager
        
    var body: some View {
        VStack {
            HStack {
                Spacer()
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Spacer()
                Text(String(userManager.countName))
                    .foregroundColor(userManager.nameIsValid ? .green : .red)
                    .offset(x: -20)
            }
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
    private func registerUser() {
        userManager.user.isRegistred.toggle()
        DataManager.shared.saveUserData(user: userManager.user)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
