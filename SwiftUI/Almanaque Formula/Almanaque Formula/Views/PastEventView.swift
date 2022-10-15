//
//  PastEvent.swift
//  Almanaque Formula
//
//  Created by Donizetti de Souza on 10/12/22.
//

import SwiftUI

struct PastEventView: View {
    // MARK: - Properties
    
    var events: [PastEvent] = pastEventData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(events){ item in
                    NavigationLink(destination: EventDetailView(event: item)) {
                        PastEventDetailView(event: item)
                    }
                    
                   
//
//                    PastEventDetailView(event: item)
//                    NavigationLink(destination: EventDetailView(event: item))
                    
                } //ForEach
            } //VStack
        } //ScrollView
    }
}

struct PastEvent_Previews: PreviewProvider {
    static var previews: some View {
        PastEventView(events: pastEventData)
         .previewLayout(.sizeThatFits)
    }
}
