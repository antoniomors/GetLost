//
//  DetailView.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 13/06/22.
//

import SwiftUI

struct DetailView: View {
    let scrum: CardModel
    var sense: [Sense] = [Sense(name: "Via Stica, Naples", creation: "01/12/2022", emote: Image(systemName: "nose.fill"), color: .green),
                          Sense(name: "Via Mazzi, Naples", creation: "08/04/2021", emote: Image(systemName: "hand.wave"), color: .yellow)]

    var body: some View {
        GeometryReader { proxy in
        ScrollView {
            VStack {
                if let url = scrum.imageURL {
//                    AsyncImage(url: url)
//                    { image in
//                        image
////                            .resizable()
//
//                    } placeholder: {
//                        EmptyView()
//                    }
                    AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: proxy.size.width)
                                            .frame(height: 500)
                                    case .failure:
                                        Image(systemName: "photo")
                                    @unknown default:
                                        // Since the AsyncImagePhase enum isn't frozen,
                                        // we need to add this currently unused fallback
                                        // to handle any new cases that might be added
                                        // in the future:
                                        EmptyView()
                                    }
                                }

                }
                ForEach(sense) { i in
                    Card(text: i)
                }
            }
            Spacer()
        }
        }
        .navigationTitle(scrum.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: CardModel(id: UUID(), title: String()))
    }
}

struct Sense: Identifiable {
    var id = UUID()
    var name: String
    var creation: String
    var emote : Image
    var color: Color
}

struct Card: View {

    @State var text: Sense

    var body: some View {
        HStack {
            text.emote
                .font(.system(size: 28))
                .foregroundColor(text.color)
                .padding()
            Spacer()
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 320, height: 100)
                    .foregroundColor(Color(red: 0.2784313725490196, green: 0.2784313725490196, blue: 0.2784313725490196))
                VStack(alignment: .leading, spacing: 5) {

                    Text(text.name)
                        .fontWeight(.heavy)
                        .padding(.bottom, 1)

                    Text(text.creation)
                }.padding()
            }
            Spacer()
        }
    }
}
