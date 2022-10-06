//
//  FruitModel.swift
//  Fructus
//
//  Created by Donizetti de Souza on 10/4/22.
//

import SwiftUI

// MARK: - Fruits data Model

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
