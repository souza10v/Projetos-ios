//
//  FructusApp.swift
//  Fructus
//
//  Created by Donizetti de Souza on 10/4/22.
//

import SwiftUI

@main
struct FructusApp: App {
    
    @AppStorage ("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else{
                ContentView()
            }
            
        }
    }
}
