//
//  CardModel.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 13/06/22.
//

import Foundation

struct CardModel: Identifiable {
    let id: UUID
    var title: String
    var imageURL: URL?

    init(id: UUID = UUID(), title: String, imageURL: URL? = nil) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
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

//extension Array: RawRepresentable where Element == CardModel {
//    public init?(rawValue: String) {
//        guard let data = rawValue.data(using: .utf8),
//            let result = try? JSONDecoder().decode([CardModel].self, from: data)
//        else {
//            return nil
//        }
//        self = result
//    }
//
//    public var rawValue: String {
//        guard let data = try? JSONEncoder().encode(self),
//            let result = String(data: data, encoding: .utf8)
//        else {
//            return "[]"
//        }
//        return result
//    }
//}

//extension CardModel {
//    static let sampleData: [CardModel] =
//    [
//
//    ]
//}
