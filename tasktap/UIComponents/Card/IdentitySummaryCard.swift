//
//  IdentitySummaryCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 23/04/26.
//

import SwiftUI

private typealias Tokens = DesignTokens

// MARK: - Identity Summary Card

/// Small stat badge displaying a single metric (streak, level, rituals, etc.).
/// Shows icon, value, and label in a compact card format.
/// Used in Identity screen stats bento grid.
struct IdentitySummaryCard: View {
    let icon: String
    let iconColor: Color
    let value: String
    let label: String

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: Tokens.Spacing.md) {
                Image(systemName: icon)
                    .foregroundStyle(iconColor)
                Text(value)
                    .foregroundStyle(Color.defaultText)
                    .font(.inter(.bold, size: 24))
                Text(label.uppercased())
                    .foregroundStyle(Color.greyText)
                    .font(.inter(.bold, size: Tokens.Font.categoryLabel))
            }
            .padding(Tokens.Card.identityCardPadding)
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * Tokens.Card.identityCardWidth)
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.card))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        IdentitySummaryCard(
            icon: "flame",
            iconColor: Color.redIconAccent,
            value: "14 Days",
            label: "Current Streak"
        )
    }
}
