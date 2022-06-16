//
//  CollectionView.swift
//  GetLost
//
//  Created by Antonio Amoroso on 21/05/22.
//

import SwiftUI

import SwiftUI

struct CollectionView: View {
    @State var showNewDerive = false
    @ObservedObject private var settings = UserSettings()
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        List {
            ForEach(settings.cardListSave, id: \.id) { (scrum: CardModel) in
                NavigationLink {
                    DetailView(scrum: scrum)
                } label: {
                    CardView(scrum: scrum)
                }
            }
            .onDelete { (indexSet) in
                for index in indexSet {
                    self.settings.cardListSave.remove(at: index)
                }
            }
        }
        .navigationTitle("Collection")
        .toolbar {
            Button(action: {
                self.showNewDerive.toggle()
            }) {
                Image(systemName: "folder.badge.plus")
                    .foregroundColor(.white)
            }
        }.sheet(isPresented: $showNewDerive) {
            newDerive()
        }
        .padding(.top, 16)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CollectionView()
        }
    }
}
