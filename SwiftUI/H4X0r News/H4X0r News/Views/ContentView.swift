//
//  ContentView.swift
//  H4X0r News
//
//  Created by Donizetti de Souza on 9/13/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() //conectar com arquivo responsavel pela api, obserbale torna arquivo lido em networkmanager
    
    var body: some View {
        NavigationView{ //cria a view
            List(networkManager.posts) { post in //list recebe posts e popula a lista. quando post muda
                NavigationLink(destination: DetailView(url: post.url)) { //cria um link para cada elemento representado por ">" na frente da linha, levando para tela detailview
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    } //exibe texto
                }
            }
            .navigationBarTitle("H4X0r News")
        }
        .onAppear {
            self.networkManager.fetchData() // quando a view for carrega chama o metodo
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post:Identifiable { //estrutura com propriedade id por isso identifiable protocolo usado
//    let id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]
