//
//  GetLostApp.swift
//  GetLost
//
//  Created by Antonio Amoroso on 19/05/22.
//

import SwiftUI

@main

struct GetLostApp: App {
    @ObservedObject var settings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if !settings.isOnboardingShown {
                    NavigationView {
                        OnboardingView(isOnboardingShown: $settings.isOnboardingShown)
                    }
                } else {
                    Home()
                }
            }.environmentObject(settings)
        }
    }
}
