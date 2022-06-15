//
//  PlaceAnnotationView.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 14/06/22.
//

import SwiftUI

struct PlaceAnnotationView: View {
    @State private var showTitle = true
    var opacity: Bool  = true
    
    let title: String

  var body: some View {
    VStack(spacing: 0) {
      Text(title)
        .font(.callout)
        .padding(5)
        .foregroundColor(.black)
        .background(Color(.white))
        .cornerRadius(10)
        .opacity(showTitle ? 0 : 1)

      Image(systemName: "circle.fill")
        .font(.title)
        .foregroundColor(.red)

//      Image(systemName: "arrowtriangle.down.fill")
//        .font(.caption)
//        .foregroundColor(.red)
//        .offset(x: 0, y: -5)
    }
    .onTapGesture {
      withAnimation(.easeInOut) {
        showTitle.toggle()
      }
    }
  }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
    PlaceAnnotationView(title: "Empire State Building")
          .background(.gray)
  }
}

