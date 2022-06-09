//
//  OnboardingViewModel.swift
//  AppMap
//
//  Created by Muhamed Agakishiev on 26/05/22.
//

import Foundation
import SwiftUI

struct SimpleOnboardingViewModel {
    let text: String
    let text2: String
    let image: Image
    let buttonTitle: String

    init(text: String, text2: String, image: Image, buttonTitle: String = "Skip") {
        self.text = text
        self.text2 = text2
        self.image = image
        self.buttonTitle = buttonTitle
    }
}

struct OnboardingView: View {
    @Binding var isOnboardingShown: Bool

    @ViewBuilder
    var currentView: some View {
        SimpleOnboardingView() {
            self.isOnboardingShown.toggle()
        }
    }

    var body: some View {
        VStack {
            currentView
        }
    }
}

struct SimpleOnboardingView: View {
    var onSkip: () -> Void

    var body: some View {
        TabView {
            FirstView(
                viewModel:  SimpleOnboardingViewModel(
                    text: "Welcome in GetLost!",
                    text2: "GetLost is inspired by the **Theory of dérive** by Guy Debord\n\n\nLet yourself be drawn by an unplanned journey and enjoy the experience of an emotional disorientation",
                    image: Image("logoIntro")
                )
            ) {
                onSkip()
            }
            SecondView(
                viewModel:  SimpleOnboardingViewModel(
                    text: "\n\nRelax and start your exploration taking track of all your Sensations\n",
                    text2:"\nThe Map will be filled with your Emotional Records, each having a specific color",
                    image: Image("mapBoard"))
            ) {
                onSkip()
            }

            ThirdView(
                viewModel: SimpleOnboardingViewModel(
                    text: "\nYou will be part\n\n",
                    text2: "\nGo back to Paths whenever you want",
                    image: Image("mapBoard"),
                    buttonTitle: "Get Lost!"
                )
            ) {
                onSkip()
            }
        }
        .tabViewStyle(.page)
    }
}

struct FirstView: View {
    let viewModel: SimpleOnboardingViewModel
    let onSkip: () -> Void

    private let headerFont = Font.system(size: 24, weight: .medium)
    private let buttonFont = Font.system(size: 20, weight: .bold)

    var body: some View {
        VStack {
            Text(viewModel.text)
                .fontWeight(.bold)
            Spacer()
            viewModel.image
                .resizable()
                .frame(width: 150.0, height: 150.0)
Spacer()
            Text(viewModel.text2)
Spacer()
            Button(action: {
                onSkip()
            }) {
                Text(viewModel.buttonTitle)
                    .padding(8)
            }
            .buttonStyle(OnboardingButton())
            .padding(.horizontal, 36)
            Spacer()
        }
    }

}

struct SecondView: View {
    let viewModel: SimpleOnboardingViewModel
    let onSkip: () -> Void

    private let headerFont = Font.system(size: 24, weight: .medium)
    private let buttonFont = Font.system(size: 20, weight: .bold)

    var body: some View {
        VStack {
            viewModel.image
                .frame(height: 200.0)
            Spacer()
            Text(viewModel.text)
            Text(viewModel.text2)
            Spacer()
            Button(action: {
                onSkip()
            }) {
                Text(viewModel.buttonTitle)
                    .padding(8)
            }
            .buttonStyle(OnboardingButton())
            .padding(.horizontal, 36)
            Spacer()
        }
    }

}

struct ThirdView: View {
    let viewModel: SimpleOnboardingViewModel
    let onSkip: () -> Void

    private let headerFont = Font.system(size: 24, weight: .medium)
    private let buttonFont = Font.system(size: 20, weight: .bold)

    var body: some View {
        VStack {
            viewModel.image
                .frame(height: 200.0)
            Spacer()
            Text(viewModel.text)
            Text(viewModel.text2)
            Spacer()
            Button(action: {
                onSkip()
            }) {
                Text(viewModel.buttonTitle)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 2)
                )
            }
            .background(Color.white)
            .cornerRadius(25)
            .padding(.horizontal, 50)
            Spacer()
        }
    }

}

struct OnboardingButton: ButtonStyle {

    var secondary = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.primary)
    }
}

