//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Donizetti de Souza on 10/5/22.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - Properties
    
    var name: String
    var content: String? = nil //opcional pois pode ser nulo
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            
            HStack{
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil ) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }//: HStack
        }//: VStack
    }
}

// MARK: - Preview

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "John/ Jane")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
        
        SettingsRowView(name: "Website", linkLabel: "wiftUI Masterclass", linkDestination: "swifuimasterclass.com")
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
