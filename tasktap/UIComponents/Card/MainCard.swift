//
//  MainCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 31/03/26.
//

import SwiftUI

private typealias Tokens = DesignTokens

// MARK: - Main Card

/// Large editorial card for high-priority or featured tasks.
/// Displays task with left accent bar, title, description, and metadata.
/// Typically used in Focus view for "Priority Focus" section.
struct MainCard: View {
    var body: some View {
        GeometryReader { geo in
            HStack {
                RoundedRectangle(cornerRadius: Tokens.AccentBar.cornerRadius)
                    .fill(Color.brownAccent)
                    .frame(width: Tokens.AccentBar.width)

                VStack(spacing: Tokens.Spacing.section) {

                    HStack {
                        Text("DEEP WORK")
                        Spacer()
                        Image(systemName: "circle.circle")
                    }
                    .font(.inter(.medium, size: Tokens.Font.categoryLabel))
                    .bold()
                    .foregroundStyle(Color.brownAccent)
                    
                    VStack(alignment: .leading, spacing: Tokens.Spacing.md) {
                        Text("Refactor Identity Module")
                            .font(.inter(.bold, size: Tokens.Font.titleLarge))
                            .foregroundStyle(Color.defaultText)
                        Text("Clean up the core authentication logic for the next sprint.")
                            .font(.inter(.regular, size: Tokens.Font.titleSmall))
                            .foregroundStyle(Color.defaultText)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        HStack {
                            Image(systemName: "clock")
                            Text("1h 30m")

                        }
                        .font(.inter(.bold, size: Tokens.Font.metadata))
                        .foregroundStyle(Color.greyDarkText)
                        HStack {
                            Image(systemName: "exclamationmark")
                            Text("High Priority")
                        }
                        .font(.inter(.bold, size: Tokens.Font.metadata))
                        .bold()
                        Spacer()
                    }.foregroundStyle(Color.greyDarkText)
                }
                .padding(.horizontal, Tokens.Card.mainCardHPadding)
                .padding(.vertical, Tokens.Card.mainCardVPadding)

            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * Tokens.Card.mainCardWidth)
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.md))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()

        MainCard()
    }
}
