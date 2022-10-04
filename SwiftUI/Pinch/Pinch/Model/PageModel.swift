//
//  PageModel.swift
//  Pinch
//
//  Created by Donizetti de Souza on 10/3/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
