//
//  PriorityFocusSection.swift
//  tasktap
//

import SwiftUI

private typealias Tokens = DesignTokens

struct PriorityFocusSection: View {
    let tasks: [TaskItem]

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Spacing.lg) {
            HStack {
                Text("Priority Focus")
                    .font(.inter(.bold, size: Tokens.Font.titleLarge))
                    .foregroundStyle(Color.defaultText)
                Spacer()
                Text("\(tasks.count) ACTIVE")
                    .font(.inter(.bold, size: Tokens.Font.categoryLabel))
                    .foregroundStyle(Color.brownAccent)
            }

            if tasks.isEmpty {
                Text("No tasks today. Enjoy the calm.")
                    .font(.inter(.regular, size: Tokens.Font.titleSmall))
                    .foregroundStyle(Color.greyText)
                    .padding(.vertical, Tokens.Spacing.lg)
            } else {
                VStack(spacing: Tokens.Spacing.lg) {
                    ForEach(tasks) { task in
                        MainCard(task: task)
                    }
                }
            }
        }
    }
}
