//
//  StateAndDataFlowAppApp.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

@main
struct StateAndDataFlowAppApp: App {
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager())
        }
    }
}
