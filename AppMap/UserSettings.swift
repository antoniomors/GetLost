//
//  UserSettings.swift
//  Arcadia11
//
//  Created by Muhamed Agakishiev on 21/11/21.
//

import Foundation
import Combine
import SwiftUI

class UserSettings: ObservableObject {
    @AppStorage("isOnboardingShown")
    var isOnboardingShown: Bool = false
    
    func reset() {
        isOnboardingShown = false
    }
}
