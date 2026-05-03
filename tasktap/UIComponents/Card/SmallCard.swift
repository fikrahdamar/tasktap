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
/// Displays task with red accent bar, status label, and due time.
/// Typically used in Focus view for "Urgent Tasks" bento grid (2-column layout).
struct SmallCard: View {
    let task: TaskItem

    private var deadlineLabel: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: task.deadline)
    }

    var body: some View {
        GeometryReader { geo in
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
                    HStack {
                        Text(deadlineLabel)
                            .font(.inter(.black, size: Tokens.Font.categoryLabel))
                            .foregroundStyle(Color.greyText)
                        Spacer()
                        RoundedRectangle(cornerRadius: Tokens.Radius.pill)
                            .fill(task.priority.accentColor)
                            .frame(width: 12, height: 12)
                    }
                }
                .padding(.horizontal, Tokens.Card.smallCardHPadding)
                .padding(.vertical, Tokens.Card.smallCardVPadding)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * Tokens.Card.smallCardWidth)
            .background(Color.cardSmall)
            .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.cardSm))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    let task = TaskItem(
        title: "Ngumpulin tugas Prototype",
        priority: .high,
        deadline: Date()
    )
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        SmallCard(task: task)
    }
}
