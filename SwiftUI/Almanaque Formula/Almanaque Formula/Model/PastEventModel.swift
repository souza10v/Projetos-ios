//
//  PastEventModel.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/12/22.
//

import SwiftUI

// MARK: - PAST EVENT MODEL

struct PastEvent: Identifiable {
    var id = UUID()
    var eventName: String
    var eventImageName: String
    var eventDate: String
    var eventDetails: String
    var circuitName: String
    var nextEventWeekend: String
    var eventYearNumber: Int
}
