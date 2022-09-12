//
//  InfoView.swift
//  DoniCard
//
//  Created by Donizetti de Souza on 9/8/22.
//

import SwiftUI

struct ExtractedView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: 300, height: 30)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text).foregroundColor(.black)
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
