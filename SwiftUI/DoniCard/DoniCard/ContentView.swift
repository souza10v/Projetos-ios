//
//  ContentView.swift
//  DoniCard
//
//  Created by Donizetti de Souza on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.15, green: 0.68, blue: 0.38)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("gatinho")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 300)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5))
                
                Text("Gatinho")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .dynamicTypeSize(.xLarge)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                ExtractedView(text: "+334 443 344", imageName: "phone.fill")
                ExtractedView(text: "contato@gatinho.com", imageName: "envelope.fill")
   
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

