//
//  emptyDerive.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 08/06/22.
//

import SwiftUI

struct emptyDerive: View {
    @State var showNewDerive: Bool = false

    var body: some View {
        NavigationView {
            VStack {

                Image("emptyDerive")
                    .offset(x: 0, y: -100)
                    .padding(-70)

                Text("No Dérive created yet\n\n")
                    .font(.system(size: 24))
                    .padding(30)
                Button(action: {
                    self.showNewDerive.toggle()
                }, label: {
                    Image(systemName: "folder.badge.plus")
                        .font(.system(size: 48))
                }
                ).foregroundColor(.white)
                    .sheet(isPresented: $showNewDerive) {
                        newDerive()
                    }

                Text("\n\nCreate a new Dérive experience")
                    .font(.system(size: 20))
            }
        }
    }
}

struct newDerive: View {
    @State var showNewDerive = false
    @State private var name: String = ""

    @ObservedObject private var settings = UserSettings()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Text("Create your new Dérive")
                    .font(.system(size: 24))
                    .navigationBarItems(leading: Button(action: {
                        self.dismiss()
                    }) {
                        Text("Cancel")
                            .bold()
                            .foregroundColor(.white)
                    }, trailing: Button (action: {

                        self.dismiss()

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let newModel = CardModel(title: name)
                            settings.cardListSave.append(newModel)
                        }
                    }) {
                        Text("Done")
                            .bold()
                            .foregroundColor(.white)
                    });
                Spacer()
                TextField("Insert project title...", text: $name)
                    .frame(width: 300)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 60)
                            .stroke(.gray)
                    )
                Spacer()
                    .frame(height: 500)
            }
        }
    }
}

//struct emptyDerive_Previews: PreviewProvider {
//    static var previews: some View {
//        emptyDerive()
//    }
//}
