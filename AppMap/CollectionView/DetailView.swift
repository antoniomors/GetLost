//
//  DetailView.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 13/06/22.
//

import SwiftUI

struct DetailView: View {
    let scrum: CardModel

    var body: some View {
        List {
            Text("Ciao")
//            Section(header: Text("Meeting Info")) {
//                NavigationLink(destination: newDerive()) {
//                    Label("Start Meeting", systemImage: "timer")
//                        .font(.headline)
//                        .foregroundColor(.accentColor)
//                }
//                HStack {
//                    Label("Length", systemImage: "clock")
//                    Spacer()
//                    Text("\(scrum.lengthInMinutes) minutes")
//                }
//                .accessibilityElement(children: .combine)
//                HStack {
//                    Label("Theme", systemImage: "paintpalette")
//                    Spacer()
//                    Text(scrum.theme.name)
//                        .padding(4)
//                        .foregroundColor(scrum.theme.accentColor)
//                        .background(scrum.theme.mainColor)
//                        .cornerRadius(4)
//                }
//                .accessibilityElement(children: .combine)
//            }
//            Section(header: Text("Attendees")) {
//                ForEach(scrum.attendees) { attendee in
//                    Label(attendee.name, systemImage: "person")
//                }
//            }
        }
        .navigationTitle(scrum.title)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            DetailView(scrum: CardModel.sampleData[0])
//        }
//    }
//}
