

import SwiftUI

struct StarterView: View {
    @AppStorage("isRegister") private var isRegiser : Bool?
    
    var body: some View {
        Group {
            if isRegiser ?? false {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
