//
//  CollectionView.swift
//  AppMap
//
//  Created by Antonio Amoroso on 21/05/22.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        List {
            HStack {
                Text("Collection0")
            }
        }.listStyle(.insetGrouped)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
