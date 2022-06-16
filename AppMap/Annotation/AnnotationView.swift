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
    
    @ObservedObject private var settings = UserSettings()
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 20.0,
            longitude: 20.0),
        latitudinalMeters: .init(10000),
        longitudinalMeters: .init(10000))
    
    var body: some View {
        
        let regionWithOffset = Binding<MKCoordinateRegion>(
            get: {
                let offsetCenter = CLLocationCoordinate2D(latitude: region.center.latitude + region.span.latitudeDelta * 0.30, longitude: region.center.longitude)
                return MKCoordinateRegion(
                    center: offsetCenter,
                    span: region.span)
            },
            set: {
                $0
            }
        )
        
        if let cardsWithLocation = Optional(settings.cardListSave.filter({ $0.photo != nil })) {
            Map(coordinateRegion: regionWithOffset, annotationItems: cardsWithLocation) { card in
                MapAnnotation(coordinate: card.photo!.location.clCoordinate) {
                    PlaceAnnotationView(title: card.title)
                }
            }
        }
        else {
            Map(coordinateRegion: regionWithOffset, interactionModes: MapInteractionModes.all)
        }
    }
}

struct AnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationView()
    }
}

extension CLLocationCoordinate2D: Identifiable, Hashable, Equatable {
    public var id: Int {
        return hashValue
    }
    
    public func hash(into hasher: inout Hasher)  {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
    public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
    }
    
    public static func <(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.longitude < rhs.longitude
    }
}
