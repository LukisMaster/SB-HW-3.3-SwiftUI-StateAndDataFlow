

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    
    @AppStorage("name") private var nameStorage : String?
    @AppStorage("isRegister") private var isRegister : Bool?
    
    var body: some View {
        VStack {
            Text("Hi, \(nameStorage ?? "noname")!")
                .font(.title)
                .offset(y: 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(y: 100)
            Spacer()
            ButtonView(color: .red, title: "\(timer.buttonTitle)", action: timer.startTimer)
            Spacer()
            ButtonView(color: .blue, title: "LogOut", action: {isRegister?.toggle()})
                .offset(y: -50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    
    var color: Color
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
