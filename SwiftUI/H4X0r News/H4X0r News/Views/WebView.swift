//
//  WebView.swift
//  H4X0r News
//
//  Created by Donizetti de Souza on 9/13/22.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable { //chamar navegador
    
    let urlString: String?
    
    func makeUIView(context: Context) -> some WKWebView {//cria uma view e faz ela virar uiswift
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { //atualiza a view na tela
        if let safeString = urlString{ //verrifica se existe alguma string
            if let url = URL(string: safeString) {//chama o metodo de criar url
                let request = URLRequest(url: url) //chama o html da pagina
                uiView.load(request) //carrega a view
            }
        }
    }
    
}
