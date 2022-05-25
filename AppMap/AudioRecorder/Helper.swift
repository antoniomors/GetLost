//
//  Helper.swift
//  Recordino
//
//  Created by Aida Hyseni on 21/05/22.
//

import Foundation
func getCreationDate(for file:URL)->Date{
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
       let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    }
    else {
        return Date()
    }
}
