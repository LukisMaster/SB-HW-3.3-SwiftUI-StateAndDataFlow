

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var buttonDisabled = true
    
    var a : String = "123"
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Spacer()
                Text(String(name.count))
                    .foregroundColor(name.count > 2 ? .green : .red)
                    .offset(x: -20)
            }
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .disabled(name.count < 3 ? true : false)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
