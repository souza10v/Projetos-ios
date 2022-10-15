//
//  PastEventView.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/12/22.
//

import SwiftUI

struct PastEventDetailView: View {
    
    var event: PastEvent
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack (alignment: .center, spacing: -10){
                Text(event.eventName)
                    .modifier(TitleModifier())
                    .fontWeight(.bold)
                Text(event.eventDate.suffix(4))
                    .fontWeight(.thin)
                    .modifier(TitleModifier())
            }
            ZStack(alignment: .bottom) {
                Image(event.eventImageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                .frame(width: 225, height: 301)
                Text("Info")
                    .foregroundColor(.white)
                    .modifier(TitleModifier())
                    .fontWeight(.bold)
                    .frame(width: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.white.opacity(0.6)))
            } //ZStack
        } //VStack
//        .zIndex(0)
//        .frame(width: 250, height: 410, alignment: .top)
//        .padding(.top)
//        .background(Color.white.opacity(0.05))
//        .cornerRadius(20)
    }
}

struct PastEventView_Previews: PreviewProvider {
    static var previews: some View {
        PastEventDetailView(event: pastEventData[0])
            .previewLayout(.sizeThatFits)
            
    }
}
