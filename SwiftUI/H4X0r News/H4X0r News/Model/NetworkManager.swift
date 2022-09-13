//
//  NetworkManager.swift
//  H4X0r News
//
//  Created by Donizetti de Souza on 9/13/22.
//

import Foundation

class NetworkManager: ObservableObject { // observableobject usado para enviar dados
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){//se possivel gerar um url da string
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data { //para garantir que data tera dados cria-se o if
                        do { //caso haja dados faca
                            let results = try decoder.decode(Results.self, from: safeData) //Results protocolo dentro de PostData
                            DispatchQueue.main.sync {
                                self.posts = results.hits // self dentro do protocolo se referindo a algo de fora. Carrega os dados para enviar a lista
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
