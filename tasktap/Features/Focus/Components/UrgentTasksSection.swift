//
//  UrgentTasksSection.swift
//  tasktap
//

import SwiftUI

private typealias Tokens = DesignTokens

struct UrgentTasksSection: View {
    let tasks: [TaskItem]

    private let columns = [
        GridItem(.flexible(), spacing: Tokens.Spacing.lg),
        GridItem(.flexible(), spacing: Tokens.Spacing.lg)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Spacing.lg) {
            Text("Urgent Tasks")
                .font(.inter(.bold, size: Tokens.Font.titleLarge))
                .foregroundStyle(Color.defaultText)

            if tasks.isEmpty {
                Text("No urgent tasks right now.")
                    .font(.inter(.regular, size: Tokens.Font.titleSmall))
                    .foregroundStyle(Color.greyText)
                    .padding(.vertical, Tokens.Spacing.lg)
            } else {
                LazyVGrid(columns: columns, spacing: Tokens.Spacing.lg) {
                    ForEach(tasks) { task in
                        SmallCard(task: task)
                    }
                }
            }
        }
        .padding(.top, Tokens.Spacing.md)
    }
}
