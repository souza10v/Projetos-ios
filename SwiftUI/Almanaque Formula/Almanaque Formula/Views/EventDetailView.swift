//
//  EventDetailView.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/12/22.
//

import SwiftUI

struct EventDetailView: View {
    
    var event: PastEvent
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                // MARK: HEADER
                VStack{
                    HStack(alignment: .top) {
                        Text(event.eventName)
                            .modifier(TitleModifier())
                            .fontWeight(.bold)
                        Text(event.eventDate.suffix(4))
                            .fontWeight(.thin)
                            .modifier(TitleModifier())
                    } //HStack
                    
                    // MARK: IMAGE
                    HStack {
                        Image("imagemActualEvent")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                    } //HStack
                    
                    // MARK: DESCRIPTION
                    HStack {
                        VStack(spacing: 20){
                            Text(event.circuitName)
                                .multilineTextAlignment(.center)
                            Text(event.eventDetails)
                        } //VStack
                    } //HStack
                    .padding(.top, 10)
                } //VStack
                // MARK: RESULT
                Text("Resultado")
                    .modifier(TitleModifier())
                    .fontWeight(.bold)
            }
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: pastEventData[0])
    }
}
