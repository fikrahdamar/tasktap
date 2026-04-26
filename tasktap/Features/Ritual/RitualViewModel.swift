import SwiftUI

// MARK: - RitualViewModel

@Observable
final class RitualViewModel {

    // MARK: - State
    var displayedMonth: Date
    var selectedDate: Date = .now

    private let calendar: Calendar = {
        var cal = Calendar(identifier: .gregorian)
        cal.firstWeekday = 2 // Monday
        return cal
    }()

    init() {
        let comps = Calendar.current.dateComponents([.year, .month], from: .now)
        self.displayedMonth = Calendar.current.date(from: comps) ?? .now
    }

    // MARK: - Navigation
    func goToPreviousMonth() {
        displayedMonth = calendar.date(byAdding: .month, value: -1, to: displayedMonth) ?? displayedMonth
    }

    func goToNextMonth() {
        displayedMonth = calendar.date(byAdding: .month, value: 1, to: displayedMonth) ?? displayedMonth
    }

    // MARK: - Computed Strings
    var monthLabel: String {
        displayedMonth.formatted(.dateTime.month(.wide).year()).uppercased()
    }

    var agendaDateLabel: String {
        let date = selectedDate.formatted(.dateTime.month(.abbreviated).day())
        return calendar.isDateInToday(selectedDate) ? "\(date), Today" : date
    }

    // MARK: - Grid

    /// Returns 42-cell grid (6 rows × 7 cols). nil = empty padding.
    func daysGrid() -> [Date?] {
        guard let range = calendar.range(of: .day, in: .month, for: displayedMonth) else { return [] }

        let firstWeekday = calendar.component(.weekday, from: displayedMonth)
        // Monday-based offset: Mon=0, Tue=1 ... Sun=6
        let offset = (firstWeekday - 2 + 7) % 7

        var days: [Date?] = Array(repeating: nil, count: offset)
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: displayedMonth) {
                days.append(date)
            }
        }
        while days.count % 7 != 0 { days.append(nil) }
        return days
    }

    // MARK: - Task Helpers

    func tasks(for date: Date, in allTasks: [TaskItem]) -> [TaskItem] {
        allTasks.filter { calendar.isDate($0.deadline, inSameDayAs: date) }
    }

    func isToday(_ date: Date) -> Bool {
        calendar.isDateInToday(date)
    }

    func isSelected(_ date: Date) -> Bool {
        calendar.isDate(date, inSameDayAs: selectedDate)
    }

    func isCurrentMonth(_ date: Date) -> Bool {
        calendar.isDate(date, equalTo: displayedMonth, toGranularity: .month)
    }
}
