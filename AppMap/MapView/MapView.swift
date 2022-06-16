//
//  MapViewNew.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 09/06/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @EnvironmentObject var mapData: MapViewModel

    @Binding var annotationItems: [CardModel]

    init(annotationItems: Binding<[CardModel]>) {
        self._annotationItems = annotationItems
    }

    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }

    func makeUIView(context: Context) -> MKMapView {

        let view = mapData.mapView

        view.showsUserLocation = true
        view.delegate = context.coordinator
        view.pointOfInterestFilter = .excludingAll

        return view
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let annotations: [MKPointAnnotation] = self.annotationItems.compactMap { card in
            guard let photo = card.photo else { return nil }
            let coordinate = photo.location.clCoordinate
            let result = MKPointAnnotation()
            result.coordinate = coordinate
            result.title = card.title
            return result
        }

        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
    }

    class Coordinator: NSObject,MKMapViewDelegate{

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

            // Custom Pins....

            // Excluding User Blue Circle...

            if annotation.isKind(of: MKUserLocation.self){return nil}
            else{
                let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN_VIEW")
                pinAnnotation.tintColor = .red
                pinAnnotation.animatesDrop = true
                pinAnnotation.canShowCallout = true

                return pinAnnotation
            }
        }
    }
}

