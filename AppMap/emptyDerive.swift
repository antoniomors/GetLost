//
//  emptyDerive.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 08/06/22.
//

import SwiftUI

struct emptyDerive: View {
    @State var showNewDerive = false
    var body: some View {
        NavigationView {
            VStack {

                Image("emptyDerive")
                    .offset(x: 0, y: -100)
                    .padding(-70)

                Text("No Dérive created yet\n\n")
                    .font(.system(size: 24))
                    .padding(40)
                Button(action: {
                    self.showNewDerive.toggle()
                }, label: {
                    Image(systemName: "folder.badge.plus")
                        .font(.system(size: 50))
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
    @State private var name: String = ""
    var body: some View {
        VStack {
            Text("Create your new Dérive")
            TextField("Search", text: $name)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct emptyDerive_Previews: PreviewProvider {
    static var previews: some View {
        emptyDerive()
    }
}
