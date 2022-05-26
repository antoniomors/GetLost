//
//  OnboardingButton.swift
//  AppMap
//
//  Created by Muhamed Agakishiev on 26/05/22.
//

import SwiftUI

struct OnboardingButton: ButtonStyle {

    var secondary = false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
//            .background(secondary ? .gray : Color.accentColor)
            .foregroundColor(Color.primary)
//            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}
