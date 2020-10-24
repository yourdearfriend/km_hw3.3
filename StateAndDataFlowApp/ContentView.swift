//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 150)
            
            Spacer()
            
            ButtonView(timer: timer)
                .padding(.bottom)
            
            ButtonViewLogOut(user: user)
            
            Spacer()
        }
    }
}
struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
        
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ButtonViewLogOut: View {
    @ObservedObject var user: UserManager
    
    var body: some View {
        Button(action: user.removeUser, label: {
            Text("Logout")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        })
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

