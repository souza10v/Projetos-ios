
//  ActualEvent.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/11/22.
//

import SwiftUI

struct ActualEvent: View {
    // MARK: - Properties
    var body: some View {
        VStack { //VStack
            
            HStack {
                Image("imagemActualEvent")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
            } //HStack
            VStack {
                HStack {
                    Text("Singapura")
                        .modifier(TitleModifier())
                        .fontWeight(.bold)
                    Text("30-02 Outubro")
                        .fontWeight(.thin)
                        .modifier(TitleModifier())
                } //HStack
                Divider()
                VStack{
                    HStack(alignment: .center, spacing: 30){
                        VStack(alignment: .leading, spacing: 0) {
                            Text("FP1")
                            Text("FP2")
                            Text("FP3")
                            Text("Q1")
                            Text("Race")
                        } //VStack
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Sexta-Feira")
                            Text("Sexta-Feira")
                            Text("Sabado")
                            Text("Sabado")
                            Text("Domingo")
                        } //VStack
                        VStack(alignment: .leading, spacing: 0) {
                            Text("06:00 PM")
                            Text("09:00 PM")
                            Text("06:00 PM")
                            Text("09:00 PM")
                            Text("09:00 PM")
                        } //VStack
                    } //HStack
                } //VStack
                .fontWeight(.light)
            } //VStack
        }
    }
}

struct IconModifeir: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 22, height: 22, alignment: .center)
    }
}

struct ActualEvent_Previews: PreviewProvider {
    static var previews: some View {
        ActualEvent()
            .previewLayout(.sizeThatFits)
    }
}
