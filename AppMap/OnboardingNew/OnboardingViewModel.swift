//
//  OnboardingViewModel.swift
//  AppMap
//
//  Created by Muhamed Agakishiev on 26/05/22.
//

import SwiftUI

struct SimpleOnboardingViewModel {
    let text: String
    let image: Image
    let buttonTitle: String
    let buttonTitle2: String

    init(text: String, image: Image, buttonTitle: String = "Next", buttonTitle2: String = "Skip") {
        self.text = text
        self.image = image
        self.buttonTitle = buttonTitle
        self.buttonTitle2 = buttonTitle2
    }
}

struct SimpleOnboardingView: View {
    let viewModel: SimpleOnboardingViewModel
    let onNext: () -> Void
    let onSkip: () -> Void
    let onBack: () -> Void

    private let headerFont = Font.system(size: 34, weight: .medium)
    private let buttonFont = Font.system(size: 20, weight: .bold)

    var body: some View {
        VStack {
            viewModel.image
            Text(viewModel.text)
                .font(headerFont)
                .foregroundColor(Color.primary)
                .padding()

            Spacer()
            Button(action: {
                onNext()
            }) {
                Text(viewModel.buttonTitle)
                    .font(buttonFont)
                    .padding(8)
            }
            .buttonStyle(OnboardingButton())
            .padding(.horizontal, 36)

            Button(action: {
                onSkip()
            }) {
                Text(viewModel.buttonTitle2)
                    .font(buttonFont)
                    .padding(8)
            }
            .buttonStyle(OnboardingButton())
            .padding(.horizontal, 36)
        }
        .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                print(value.translation)
                switch(value.translation.width, value.translation.height) {
                    case (...0, -30...30):  onNext()
                    case (0..., -30...30):  onBack()
                    default:  onNext()
                }
            }
        )
    }
}
