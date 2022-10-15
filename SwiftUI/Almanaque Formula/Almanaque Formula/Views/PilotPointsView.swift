//
//  PointsView.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/10/22.
//

import SwiftUI

struct PilotPointsView: View {
    // MARK: - Properties
    
    var pilots: [Points] = pilotPointsData
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10){
                    ForEach(pilots, id: \.id) { item in
                        Divider()
                        HStack(alignment: .center, spacing: 10){
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(100)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(spacing: -11) {
                                    Text(item.pilotName)
                                        .modifier(TitleModifier())
                                        .fontWeight(.bold)
                                    Text(item.pilotCountry)
                                        .fontWeight(.thin)
                                        .modifier(TitleModifier())
                                }
                                Text(item.pilotTeam).padding(.leading, 8)
                                    .fontWeight(.thin)
                            } //VStack
                            Spacer()
                            VStack(alignment: .trailing, spacing: 0) {
                                Text(item.pilotPoints)
                                    .fontWeight(.black)
                            } //VStack
                        } //HStack
                    } //ForEach
                } //VStack
                .padding(20)
            }//ScrollView
        } //NavigationView
    }
}



struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PilotPointsView(pilots: pilotPointsData)
    }
}
