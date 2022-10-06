//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Donizetti de Souza on 10/5/22.
//

import SwiftUI

struct FruitNutrientsView: View {
    
    // MARK: - Properties
    
    var fruit: Fruit
    let nutrients: [String]  = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    // MARK: - Body
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutricional value per 100g"){
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                           .multilineTextAlignment(.trailing) // alinhamento
                    } //:Hstack
                } //: Foreach
            } //: Disclousure
        } //: Box
    }
}

// MARK: Preview

struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 400))
            .padding()
    }
}
