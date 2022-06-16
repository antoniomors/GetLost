//
//  CardModel.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 13/06/22.
//

import Foundation
import CoreLocation

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
    
    var clCoordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

extension CLLocationCoordinate2D {
    var coordinate: Coordinate {
        .init(latitude: latitude, longitude: longitude)
    }
    
    init(coordinate: Coordinate) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}

struct PhotoModel {
    let imageURL: URL
    let location: Coordinate
}

extension PhotoModel: Codable {}

struct CardModel: Identifiable {
    let id: UUID
    var title: String
    var photo: PhotoModel?
    
    init(id: UUID = UUID(), title: String, photo: PhotoModel? = nil) {
        self.id = id
        self.title = title
        self.photo = photo
    }
}

extension CardModel {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension CardModel: Codable {}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
