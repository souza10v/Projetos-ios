//
//  FruitCardView.swift
//  Fructus
//
//  Created by Donizetti de Souza on 10/4/22.
//

import SwiftUI

struct FruitCardView: View {
    
    // MARK: Properties
    
    var fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Fruit: Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                // Fruit: Title
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                // Fruit: HeadLine
                Text(fruit.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480) //devido ao uso em telas maiores o maxwidth
                // Button: Start
                StartButtonView()
            } //: VStack
        } //: ZStack
        .onAppear{ //adiciona efeito a view
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center) //seta a cor na view toda
        .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom)) //define a cor do brackground
        .cornerRadius(20) //aredonda as bordas
        .padding(.horizontal, 20)
    }
}

// MARK: Preview

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
