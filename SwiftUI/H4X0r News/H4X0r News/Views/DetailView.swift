//
//  DetailView.swift
//  H4X0r News
//
//  Created by Donizetti de Souza on 9/13/22.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?//url recebida da navegacao de tela
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


