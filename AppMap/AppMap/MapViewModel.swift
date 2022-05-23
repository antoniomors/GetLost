//
//  MapViewModel.swift
//  AppMap
//
//  Created by Antonio Amoroso on 19/05/22.
//

import SwiftUI
import MapKit

// All map data here

class MapViewModel: ObservableObject {
    @Published var mapView = MKMapView()
    
    
//    Region...
    
    @Published var region : MKCoordinateRegion!
    
    // based on location
    
    
}
