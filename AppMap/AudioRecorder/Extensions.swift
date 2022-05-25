//
//  Extensions.swift
//  Recordino
//
//  Created by Aida Hyseni on 21/05/22.
//

import Foundation


extension Date {
    func toString(dateFormat format : String)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
