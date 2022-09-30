//
//  OnboardingView.swift
//  Restart
//
//  Created by Donizetti de Souza on 9/28/22.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20){
            // MARK: - HEADER
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation( //animacao na imagem
                        Animation
                        .easeInOut(duration: 4)
                        .repeatForever() ,
                               value: isAnimating)
            }
            
            // MARK: - CENTER
            
            Text("The time that leads to mastery is dependent on the intensiry of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = false
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: Vstack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: { //executa esse codigo apos tres segundos
            isAnimating = true
                
            })
        })
    }
}


// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
