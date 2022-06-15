//
//  AnnotationView.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 14/06/22.
//

import SwiftUI
import MapKit

struct Placito: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct AnnotationView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

  var empireStateBuilding =
  Placito(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656))

  var body: some View {
      Map(coordinateRegion: $region, annotationItems: [empireStateBuilding]) { place in
        MapAnnotation(coordinate: place.coordinate) {
        do {
            PlaceAnnotationView(title: place.name)
          }
        }
      }
      .ignoresSafeArea(edges: .all)
  }
}

struct AnnotationView_Previews: PreviewProvider {
  static var previews: some View {
      AnnotationView()
  }
}
