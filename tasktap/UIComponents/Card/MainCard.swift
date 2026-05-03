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
/// Fill parent width — caller controls sizing via frame/padding.
struct MainCard: View {
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

            VStack(spacing: Tokens.Spacing.section) {

                HStack {
                    Text(task.typeLabel)
                    Spacer()
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle.circle")
                }
                .font(.inter(.medium, size: Tokens.Font.categoryLabel))
                .bold()
                .foregroundStyle(task.priority.accentColor)

                VStack(alignment: .leading, spacing: Tokens.Spacing.md) {
                    Text(task.title)
                        .font(.inter(.bold, size: Tokens.Font.titleLarge))
                        .foregroundStyle(Color.defaultText)
                    if let desc = task.taskDescription {
                        Text(desc)
                            .font(.inter(.regular, size: Tokens.Font.titleSmall))
                            .foregroundStyle(Color.defaultText)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    HStack(spacing: Tokens.Spacing.xs) {
                        Image(systemName: "clock")
                        Text(deadlineLabel)
                    }
                    .font(.inter(.bold, size: Tokens.Font.metadata))
                    .foregroundStyle(Color.greyDarkText)

                    HStack(spacing: Tokens.Spacing.xs) {
                        Image(systemName: "exclamationmark")
                        Text(task.priority.displayLabel.uppercased())
                    }
                    .font(.inter(.bold, size: Tokens.Font.metadata))
                    .foregroundStyle(Color.greyDarkText)

                    Spacer()
                }
            }
            .padding(.horizontal, Tokens.Card.mainCardHPadding)
            .padding(.vertical, Tokens.Card.mainCardVPadding)
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(Color.card)
        .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.md))
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        MainCard(task: TaskItem(
            title: "Refactor Identity Module",
            taskDescription: "Clean up the core authentication logic for the next sprint.",
            priority: .high,
            deadline: Date()
        ))
        .padding(.horizontal, 20)
    }
}
