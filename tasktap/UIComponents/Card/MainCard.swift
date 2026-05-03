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
    let task: TaskItem

    private var deadlineLabel: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: task.deadline)
    }

    var body: some View {
        GeometryReader { geo in
            HStack {
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
                        HStack {
                            Image(systemName: "clock")
                            Text(deadlineLabel)
                        }
                        .font(.inter(.bold, size: Tokens.Font.metadata))
                        .foregroundStyle(Color.greyDarkText)
                        HStack {
                            Image(systemName: "exclamationmark")
                            Text(task.priority.displayLabel)
                        }
                        .font(.inter(.bold, size: Tokens.Font.metadata))
                        .bold()
                        Spacer()
                    }
                    .foregroundStyle(Color.greyDarkText)
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
    let task = TaskItem(
        title: "Refactor Identity Module",
        taskDescription: "Clean up the core authentication logic for the next sprint.",
        priority: .high,
        deadline: Date()
    )
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        MainCard(task: task)
    }
}
