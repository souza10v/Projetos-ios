//
//  TeamPointsView.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/14/22.
//

import SwiftUI

class ArrayModificationVM: ObservableObject {
    @Published var dataArray: [Team] = teamPointsData
    @Published var filteredArray: [Team] = []
    
    init() {
        sortArray()
    }
    
    func sortArray(){
        filteredArray = dataArray.sorted(by: { $0.teamPoints > $1.teamPoints })
        }
    }

struct TeamPointsView: View {
    // MARK: - Properties
    var teams: [Team] = teamPointsData
    
    @StateObject var vM = ArrayModificationVM()

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10){
                    ForEach(vM.filteredArray, id: \.id) { item in
                        Divider()
                        HStack(alignment: .center, spacing: 10){
                            Image(item.teamFlag)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(100)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(spacing: -11) {
                                    Text(item.teamName)
                                        .modifier(TitleModifier())
                                        .fontWeight(.bold)
//                                    Text(item.pilotCountry)
//                                        .fontWeight(.thin)
//                                        .modifier(TitleModifier())
                                }
//                                Text(item.pilotTeam).padding(.leading, 8)
//                                    .fontWeight(.thin)
                            } //VStack
                            Spacer()
                            VStack(alignment: .trailing, spacing: 0) {
                                Text(String(item.teamPoints))
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



struct TeamPointsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamPointsView(teams: teamPointsData)
    }
}
