//
//  Place.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 09/06/22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {

    var id = UUID().uuidString
    var placemark: CLPlacemark
}
