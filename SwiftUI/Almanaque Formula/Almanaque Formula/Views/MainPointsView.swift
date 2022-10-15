//
//  MainPointsView.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/14/22.
//

import SwiftUI

struct MainPointsView: View {
    
    @State private var selected = "Pilotos"
    let segments = ["Pilotos", "Equipes"]
    
    var body: some View {
        NavigationView {
            VStack{
                Picker("", selection: $selected) {
                    ForEach(segments, id:\.self) { segment in
                        Text(segment)
                            .tag(segment)
                            .modifier(TitleModifier())
                            .fontWeight(.bold)
                    }//ForEach
                }//Picker
                .padding()
                .pickerStyle(SegmentedPickerStyle())
                switch selected{
                case "Pilotos":
                    PilotPointsView()
                        .padding(.top, -20)
                case "Equipes":
                    TeamPointsView()
                        .padding(.top, -20)
                default:
                    Text("Nothing Selected")
                } //Switch
                Spacer()
            } //VStack
            .navigationBarTitle(Text("Classificação"))
        } //NavigationView
    }
}

struct MainPointsView_Previews: PreviewProvider {
    static var previews: some View {
        MainPointsView()
    }
}
