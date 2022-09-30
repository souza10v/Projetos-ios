//
//  ContentView.swift
//  Restart
//
//  Created by Donizetti de Souza on 9/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true //armazena na memoria do dispotivo
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive { //seleciona a tela a ser exibida
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
