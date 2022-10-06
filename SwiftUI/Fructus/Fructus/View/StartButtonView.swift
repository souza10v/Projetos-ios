//
//  StartButtonView.swift
//  Fructus
//
//  Created by Donizetti de Souza on 10/4/22.
//

import SwiftUI

struct StartButtonView: View {
    
    // MARK: Properties
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: Body
    
    var body: some View {
        Button(action: {
            isOnboarding = false
        }){
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25))
        } //: Button
        .accentColor(Color.white)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
