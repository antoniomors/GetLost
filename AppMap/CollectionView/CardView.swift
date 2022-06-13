//
//  CardView.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 13/06/22.
//

import SwiftUI

struct CardView: View {
    let scrum: CardModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .accessibilityAddTraits(.isHeader)
                .font(.headline)
            Spacer()
            HStack {
                Label("3", systemImage: "person.3")
                Spacer()
                Label("5", systemImage: "clock")
                    .labelStyle(DefaultLabelStyle())
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct CardView_Previews: PreviewProvider {
    static let scrum = CardModel(title: "Test")
    
    static var previews: some View {
        CardView(scrum: scrum)
            .background(.gray)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
