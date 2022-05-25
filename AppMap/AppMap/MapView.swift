//
//  MapView.swift
//  AppMap
//
//  Created by Antonio Amoroso on 19/05/22.
//

import SwiftUI
import MapKit


struct MapView: UIViewControllerRepresentable {
    
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    
    }
    func makeUIView(context: Context) -> some MKMapView {
        <#code#>
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        <#code#>
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
    }
    
}
