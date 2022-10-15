//
//  CalendarView.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/10/22.
//

import SwiftUI

struct CalendarView: View {
    // MARK: - Properties
    
    var body: some View {
 
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                Divider()
                
                // MARK: - Actual Event
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Proxima Corrida")
                        .modifier(TitleModifier())
                        .fontWeight(.bold)
                    
                    ActualEvent()
                } //VStack
                Divider()
                
                // MARK: - Past Event
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Ultimas Corridas")
                        .modifier(TitleModifier())
                        .fontWeight(.bold)
                    PastEventView()
                        .padding(.top, 0)
                } //VStack
            }.navigationBarTitle(Text("Calendário")) //ScrollView
            
            
        } //NavigationView
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title2, design: .default))
            .foregroundColor(Color.black)
            .padding(8)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
