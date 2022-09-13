//
//  PostData.swift
//  H4X0r News
//
//  Created by Donizetti de Souza on 9/13/22.
//

import Foundation

struct Results: Decodable { //estrutura de leitura dos dados da api, decodable procotolo para descodificar
    let hits: [Post]
}

struct Post: Decodable, Identifiable { //identifier pois precisa de um id para isso, por isso variavel tipo id
    var id: String {  //o id precisa receber os dados da variavel object id da api, por isso deve serchamado dessa maneira
        return objectID
    }
    let objectID: String //tipo string pois esta entre parenteses
    let points: Int
    let title: String
    let url: String? //alguns casos nao tera url, por isso o ideal eh o valor seja opcional
}
