//
//  UserSettings.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 26/05/22.
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
