import SwiftUI

// MARK: - RitualCalendarGrid

/// Month grid with priority-dot indicators per day and a selected-date highlight.
struct RitualCalendarGrid: View {

    let viewModel: RitualViewModel
    let allTasks: [TaskItem]

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)
    private let weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

    var body: some View {
        VStack(spacing: DesignTokens.Spacing.md) {
            weekdayHeader
            dayGrid
        }
        .padding(DesignTokens.Spacing.xl)
        .background(Color.card)
        .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Radius.cardSm))
    }

    // MARK: - Weekday Header
    private var weekdayHeader: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(weekdays, id: \.self) { day in
                Text(day)
                    .font(.inter(.medium, size: 11))
                    .foregroundStyle(Color.greyText)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    // MARK: - Day Grid
    private var dayGrid: some View {
        let days = viewModel.daysGrid()
        return LazyVGrid(columns: columns, spacing: DesignTokens.Spacing.sm) {
            ForEach(days.indices, id: \.self) { index in
                if let date = days[index] {
                    DayCell(
                        date: date,
                        tasks: viewModel.tasks(for: date, in: allTasks),
                        isSelected: viewModel.isSelected(date),
                        isToday: viewModel.isToday(date),
                        isCurrentMonth: viewModel.isCurrentMonth(date)
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            viewModel.selectedDate = date
                        }
                    }
                } else {
                    Color.clear.frame(height: 52)
                }
            }
        }
    }
}

// MARK: - DayCell

struct DayCell: View {

    let date: Date
    let tasks: [TaskItem]
    let isSelected: Bool
    let isToday: Bool
    let isCurrentMonth: Bool

    private var dayNumber: String {
        "\(Calendar.current.component(.day, from: date))"
    }

    private var dots: [Color] {
        // Up to 3 dots, deduplicated by priority order (high→medium→low)
        let priorities: [Priority] = [.high, .medium, .low]
        return priorities
            .filter { p in tasks.contains { $0.priority == p } }
            .prefix(3)
            .map(\.dotColor)
    }

    var body: some View {
        VStack(spacing: 4) {
            if dots.isEmpty {
                // No dots: small rounded rect behind number only
                Text(dayNumber)
                    .font(.inter(isSelected ? .bold : .regular, size: 15))
                    .foregroundStyle(labelColor)
                    .frame(width: 36, height: 36)
                    .background(isSelected ? Color.blackIconAccent : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                Color.clear.frame(height: 6)
            } else {
                // Has dots: tall pill wraps number + dots together
                VStack(spacing: 4) {
                    Text(dayNumber)
                        .font(.inter(isSelected ? .bold : .regular, size: 15))
                        .foregroundStyle(labelColor)
                        .frame(width: 36, height: 36)

                    HStack(spacing: 3) {
                        ForEach(dots.indices, id: \.self) { i in
                            Circle()
                                .fill(dots[i])
                                .frame(width: 5, height: 5)
                        }
                    }
                    .frame(height: 6)
                }
                .padding(.vertical, DesignTokens.Spacing.sm)
                .padding(.horizontal, DesignTokens.Spacing.sm)
                .background(isSelected ? Color.blackIconAccent : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .frame(height: 52)
        .animation(.easeInOut(duration: 0.15), value: isSelected)
    }

    private var labelColor: Color {
        if isSelected { return .white }
        if !isCurrentMonth { return Color.greyText.opacity(0.4) }
        if isToday { return .black }
        return Color.defaultText
    }
}

// MARK: - Priority Color Helper

extension Priority {
    var dotColor: Color {
        switch self {
        case .high:   return Color.redIconAccent
        case .medium: return Color.orangeIconAccent
        case .low:    return Color.blueIconAccent
        }
    }
}

// MARK: - Previews

#Preview("Day Cells — dot variants") {
    HStack(spacing: DesignTokens.Spacing.md) {
        // No dots
        DayCell(date: .now, tasks: [], isSelected: false, isToday: false, isCurrentMonth: true)

        // All three priority dots
        DayCell(date: .now, tasks: [
            TaskItem(title: "A", priority: .high,   deadline: .now),
            TaskItem(title: "B", priority: .medium, deadline: .now),
            TaskItem(title: "C", priority: .low,    deadline: .now),
        ], isSelected: false, isToday: false, isCurrentMonth: true)

        // Selected with dots
        DayCell(date: .now, tasks: [
            TaskItem(title: "A", priority: .high,   deadline: .now),
            TaskItem(title: "B", priority: .low,    deadline: .now),
        ], isSelected: true, isToday: false, isCurrentMonth: true)

        // Today, single dot
        DayCell(date: .now, tasks: [
            TaskItem(title: "A", priority: .medium, deadline: .now),
        ], isSelected: false, isToday: true, isCurrentMonth: true)

        // Out of month
        DayCell(date: .now, tasks: [], isSelected: false, isToday: false, isCurrentMonth: false)
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
