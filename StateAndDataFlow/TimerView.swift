

import SwiftUI

struct TimerView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.title)
                .offset(y: 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(y: 100)
            Spacer()
            ButtonView(color: .red, title: "\(timer.buttonTitle)", action: timer.startTimer)
            Spacer()
            ButtonView(color: .blue, title: "LogOut") {
                DataManager.shared.clearUserData(userManager: userManager)
            }
                .offset(y: -50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
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
