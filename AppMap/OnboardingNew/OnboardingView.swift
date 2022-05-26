//
//  OnboardingView.swift
//  AppMap
//
//  Created by Muhamed Agakishiev on 26/05/22.
//

import SwiftUI
import LocalAuthentication

enum OnboardingViewModel {
    case simple(SimpleOnboardingViewModel)
}


let onboardingList: [OnboardingViewModel] = [
    .simple(
        SimpleOnboardingViewModel(
            text: "Welcome to GetLost!\n\nGetLost is inspired by the 'Theory of dérive' by Guy Debord.\n\nLet yourself be drawn by an **unplanned journey.",
            image: Image("logoIntro")
        )
    ),
    .simple(
        SimpleOnboardingViewModel(
            text: "\nExplore the World\n\nThe Map will show you new places to explore.\nYou can also use it to explore usual paths with different eyes.",
            image: Image("logoIntro"),
            buttonTitle: "Finish"
        )
    ),
]

struct OnboardingView: View {
    let list: [OnboardingViewModel]
    let index: Int
    @Binding var isOnboardingShown: Bool

    var onboarding: OnboardingViewModel {
        self.list[index]
    }

    @ViewBuilder
    var currentView: some View {
        switch onboarding {
        case .simple(let simpleOnboardingViewModel):
            SimpleOnboardingView(viewModel: simpleOnboardingViewModel) {
                if nextView != nil {
                    finalNavigationIsActive = true
                } else {
                    self.isOnboardingShown.toggle()
                }
            }
        onSkip: {
                self.isOnboardingShown.toggle()
            }
        onBack: {
            self.isOnboardingShown.toggle()
        }
        }

        NavigationLink(
            destination: finalView,
            isActive: $finalNavigationIsActive

        ) {
            EmptyView()
        }.hidden()
            .navigationBarBackButtonHidden(true)
    }

    @State private var pinPushActive = false
    @State private var finalNavigationIsActive = false

    var finalView: AnyView {
        nextView ?? AnyView(EmptyView())
    }

    var nextView: AnyView? {
        let nextIndex = index + 1
        if list.indices.contains(nextIndex) {
            return AnyView(OnboardingView(list: list, index: nextIndex, isOnboardingShown: $isOnboardingShown))
        } else {
            return nil
        }
    }

    var body: some View {
        VStack {
            currentView
        }
    }
}

