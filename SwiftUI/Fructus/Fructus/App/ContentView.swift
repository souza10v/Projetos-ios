//
//  ContentView.swift
//  Fructus
//
//  Created by Donizetti de Souza on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    
    @State private var isShowingSetting: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSetting = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }) //: Button
            .sheet(isPresented: $isShowingSetting) {
                SettingsView()
            }
        } //: Navigation
        .navigationViewStyle(StackNavigationViewStyle()) //para estender a tela em dispotivos com tela grande
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
