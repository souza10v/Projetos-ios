//
//  ContentView.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem ({
                    Image(systemName: "calendar")
                        .renderingMode(.template)
                    Text("Calendario")
                })
            MainPointsView()
                .tabItem({
                    Image(systemName: "list.number").renderingMode(.template)
                    Text("Pontos")
                })
            PilotsView()
                .tabItem({
                    Image(systemName: "person.3.fill")
                        .renderingMode(.template)
                    Text("Pilotos")
                })
                
        } //TabView
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
