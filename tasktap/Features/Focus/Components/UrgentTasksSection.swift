//
//  UrgentTasksSection.swift
//  tasktap
//

import SwiftUI

private typealias Tokens = DesignTokens

struct UrgentTasksSection: View {
    let tasks: [TaskItem]

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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Tokens.Spacing.lg) {
                        ForEach(tasks) { task in
                            SmallCard(task: task)
                                .frame(width: 200)
                        }
                    }
                }
            }
        }
    }
}
