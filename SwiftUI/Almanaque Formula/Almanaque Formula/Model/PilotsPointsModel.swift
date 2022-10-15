//
//  PilotsPointsModel.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/13/22.
//

import SwiftUI

struct Team: Identifiable {
    var id = UUID()
    let teamName: String
    let teamPoints: Float
    let teamFlag: String
}
