//
//  MasteryMilestoneCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 24/04/26.
//

import SwiftUI

private typealias Tokens = DesignTokens


// MARK: - Mastery Milestone Card

/// Mastery milestone card on identity tabview
struct MasteryMilestoneCard: View {
    let icon: String
    let iconColor: Color
    let iconBgColor: Color
    let title: String
    let subtitle: String

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: Tokens.Spacing.sm) {
                ZStack {
                    Circle()
                        .frame(width: Tokens.CricleIcon.md, height: Tokens.CricleIcon.md)
                        .foregroundStyle(iconBgColor)
                    Image(systemName: icon)
                        .font(.inter(.regular, size: Tokens.Font.icon))
                        .foregroundStyle(iconColor)
                }
                Text(title)
                    .font(.inter(.bold, size: Tokens.Font.titleLarge))
                    .foregroundStyle(Color.greyDarkText)
                Text(subtitle.uppercased())
                    .font(.inter(.bold, size: Tokens.Font.titleSmall))
                    .foregroundStyle(Color.greyText)
            }
            .padding(Tokens.Card.mainCardHPadding)
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * Tokens.Card.mainCardWidth)
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.card))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        MasteryMilestoneCard(
            icon: "medal",
            iconColor: Color.redIconAccent,
            iconBgColor: Color.redIconBgAccent,
            title: "7-Day Ritual Master",
            subtitle: "Consistency Achievement"
        )
    }
}
