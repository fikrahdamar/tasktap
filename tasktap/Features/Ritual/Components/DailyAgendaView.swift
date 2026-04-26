import SwiftUI

// MARK: - DailyAgendaView

/// List of tasks for the selected date, each showing priority accent bar + metadata.
struct DailyAgendaView: View {

    let tasks: [TaskItem]
    let dateLabel: String

    var body: some View {
        VStack(spacing: DesignTokens.Spacing.md) {
            header
            if tasks.isEmpty {
                emptyState
            } else {
                taskList
            }
        }
    }

    // MARK: - Header
    private var header: some View {
        HStack {
            Text("Daily Agenda")
                .font(.inter(.bold, size: DesignTokens.Font.titleLarge))
                .foregroundStyle(Color.defaultText)
            Spacer()
            Text(dateLabel)
                .font(.inter(.medium, size: 13))
                .foregroundStyle(Color.defaultText)
                .padding(.horizontal, DesignTokens.Spacing.md)
                .padding(.vertical, DesignTokens.Spacing.sm)
                .background(Color.card)
                .clipShape(Capsule())
        }
    }

    // MARK: - Task List
    private var taskList: some View {
        VStack(spacing: DesignTokens.Spacing.sm) {
            ForEach(tasks.sorted { $0.priority.rawValue > $1.priority.rawValue }) { task in
                AgendaTaskRow(task: task)
            }
        }
    }

    // MARK: - Empty State
    private var emptyState: some View {
        Text("No rituals scheduled")
            .font(.inter(.regular, size: DesignTokens.Font.titleSmall))
            .foregroundStyle(Color.greyText)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, DesignTokens.Spacing.xl)
    }
}

// MARK: - AgendaTaskRow

private struct AgendaTaskRow: View {

    let task: TaskItem

    private var priorityLabel: String {
        switch task.priority {
        case .high:   return "URGENT"
        case .medium: return "FOCUS"
        case .low:    return "FLOW"
        }
    }

    private var accentColor: Color {
        switch task.priority {
        case .high:   return Color.darkRedAccent
        case .medium: return Color.brownAccent
        case .low:    return Color.darkBlueAccent
        }
    }

    private var timeLabel: String {
        task.deadline.formatted(.dateTime.hour().minute())
    }

    var body: some View {
        HStack(spacing: 0) {
            RoundedRectangle(cornerRadius: DesignTokens.AccentBar.cornerRadius)
                .fill(accentColor)
                .frame(width: DesignTokens.AccentBar.width)

            VStack(alignment: .leading, spacing: DesignTokens.Spacing.xs) {
                HStack(spacing: DesignTokens.Spacing.xs) {
                    Text(priorityLabel)
                        .font(.inter(.bold, size: DesignTokens.Font.metadata))
                        .foregroundStyle(accentColor)
                    Text("•")
                        .foregroundStyle(Color.greyText)
                    Text(timeLabel)
                        .font(.inter(.regular, size: DesignTokens.Font.metadata))
                        .foregroundStyle(Color.greyDarkText)
                }

                Text(task.title)
                    .font(.inter(.bold, size: DesignTokens.Font.titleLarge))
                    .foregroundStyle(Color.defaultText)

                if let desc = task.taskDescription {
                    Text(desc)
                        .font(.inter(.regular, size: DesignTokens.Font.titleSmall))
                        .foregroundStyle(Color.greyDarkText)
                        .lineLimit(2)
                }
            }
            .padding(.horizontal, DesignTokens.Card.mainCardHPadding)
            .padding(.vertical, DesignTokens.Card.mainCardVPadding)

            Spacer()

            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))
                .foregroundStyle(Color.greyText)
                .padding(.trailing, DesignTokens.Spacing.lg)
        }
        .background(Color.card)
        .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Radius.md))
    }
}
