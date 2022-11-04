

import SwiftUI

struct RegisterView: View {

    @State private var name = ""
    @State private var buttonDisabled = true
    
    @AppStorage("name") private var nameStorage : String?
    @AppStorage("isRegister") private var isRegister : Bool?
        
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
            .disabled(name.count < 3)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            nameStorage = name
            isRegister = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
