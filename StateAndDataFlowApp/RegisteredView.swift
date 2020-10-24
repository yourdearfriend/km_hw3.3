//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name…", text: $name)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                
                Text("\(name.count)")
                    .padding(.trailing)
                    .foregroundColor(colorCount())
                
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(activeButton())
        }
    }
}

extension RegisteredView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
            user.saveUser()
        }
    }
    
    private func colorCount() -> Color {
        name.count < 3 ? Color.red : Color.green
    }
    
    private func activeButton() -> Bool {
        name.count >= 3 ? false : true
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
