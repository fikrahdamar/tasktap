//
//  FocusHeroSection.swift
//  tasktap
//

import SwiftUI

private typealias Tokens = DesignTokens

struct FocusHeroSection: View {
    let progressPercentage: Double

    private var dateLabel: String {
        let f = DateFormatter()
        f.dateFormat = "EEEE, MMM d"
        return f.string(from: Date()).uppercased()
    }

    var body: some View {
        HStack(alignment: .top) {
            Text(dateLabel)
                .font(.inter(.medium, size: Tokens.Font.categoryLabel))
                .foregroundStyle(Color.greyText)
            Spacer()
            CircleProgressRing(
                percentage: progressPercentage,
                size: 80,
                strokeWidth: 8,
                label: nil,
                animationDuration: 0.6
            )
        }
    }
}
