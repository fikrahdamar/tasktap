//
//  SmallCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 02/04/26.
//

import SwiftUI

private typealias Tokens = DesignTokens

// MARK: - Small Card

/// Compact card for overdue or urgent tasks.
/// Fill parent width — caller controls sizing via frame (e.g. fixed width in horizontal scroll).
struct SmallCard: View {
    let task: TaskItem

    private var deadlineLabel: String {
        let f = DateFormatter()
        f.dateFormat = "h:mm a"
        return f.string(from: task.deadline)
    }

    var body: some View {
        HStack(spacing: 0) {
            RoundedRectangle(cornerRadius: Tokens.AccentBar.cornerRadius)
                .fill(task.priority.accentColor)
                .frame(width: Tokens.AccentBar.width)

            VStack(alignment: .leading, spacing: Tokens.Spacing.lg) {
                Text("DUE NOW")
                    .font(.inter(.black, size: Tokens.Font.categoryLabel))
                    .foregroundStyle(task.priority.accentColor)
                Text(task.title)
                    .font(.inter(.black, size: Tokens.Font.titleSmall))
                    .foregroundStyle(Color.greyDarkText)
                    .lineLimit(2)
                HStack {
                    Text(deadlineLabel)
                        .font(.inter(.black, size: Tokens.Font.categoryLabel))
                        .foregroundStyle(Color.greyText)
                    Spacer()
                    Circle()
                        .fill(task.priority.accentColor)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.horizontal, Tokens.Card.smallCardHPadding)
            .padding(.vertical, Tokens.Card.smallCardVPadding)
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(Color.cardSmall)
        .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.cardSm))
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        SmallCard(task: TaskItem(
            title: "Ngumpulin tugas Prototype",
            priority: .high,
            deadline: Date()
        ))
        .frame(width: 200)
        .padding()
    }
}
