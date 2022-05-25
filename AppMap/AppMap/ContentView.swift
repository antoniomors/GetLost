//
//  ContentView.swift
//  AppMap
//
//  Created by Antonio Amoroso on 19/05/22.
//

import SwiftUI
import MapKit
import 

struct ContentView: View {

    
    var body: some View {
            ZStack {
        Text("Ciao")
                    .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button("First") {
                    print("Pressed")
                }

                Button("Second") {
                    print("Pressed")
                }.foregroundColor(.black)
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


