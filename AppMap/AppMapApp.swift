//
//  AppMapApp.swift
//  AppMap
//
//  Created by Antonio Amoroso on 19/05/22.
//

import SwiftUI

@main

struct AppMapApp: App {
    @ObservedObject var settings = UserSettings()

    var body: some Scene {
        WindowGroup {
            if !settings.isOnboardingShown {
                NavigationView {
                    OnboardingView(list: onboardingList, index: 0, isOnboardingShown: $settings.isOnboardingShown)

                }
            } else {
                MapViewApp()
                    .environmentObject(settings)
            }
        }
    }
}

//struct AppMapApp: App {
//    var body: some Scene {
//        WindowGroup {
//            MapViewApp()
//        }
//    }
//}
