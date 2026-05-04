//
//  FocusView.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 23/03/26.
//

import SwiftUI
import SwiftData

private typealias Tokens = DesignTokens

struct FocusView: View {
    @Query private var tasks: [TaskItem]
    @State private var showNavTitle = false

    private let calendar = Calendar.current

    // All tasks with deadline today (for progress ring)
    private var todayAll: [TaskItem] {
        tasks.filter { calendar.isDateInToday($0.deadline) }
    }

    // Today's incomplete tasks with deadline still in the future — sorted high → low
    private var priorityTasks: [TaskItem] {
        tasks
            .filter { !$0.isCompleted && calendar.isDateInToday($0.deadline) && $0.deadline >= Date() }
            .sorted { $0.priority.rawValue > $1.priority.rawValue }
    }

    // Incomplete tasks where deadline already passed — any day
    private var urgentTasks: [TaskItem] {
        tasks.filter { !$0.isCompleted && $0.deadline < Date() }
    }

    // Completed today / total today * 100
    private var progressPercentage: Double {
        guard !todayAll.isEmpty else { return 0 }
        let completed = todayAll.filter { $0.isCompleted }.count
        return Double(completed) / Double(todayAll.count) * 100
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: Tokens.Spacing.section) {
                    FocusHeroSection(progressPercentage: progressPercentage)
                    PriorityFocusSection(tasks: priorityTasks)
                    UrgentTasksSection(tasks: urgentTasks)
                }
                .padding(.horizontal, Tokens.Spacing.lg)
                .padding(.top, Tokens.Spacing.lg)
                .padding(.bottom, Tokens.TabBar.height)
            }
            .onScrollGeometryChange(for: CGFloat.self) { geometry in
                geometry.contentOffset.y
            } action: { _, newValue in
                showNavTitle = newValue > -10
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Daily Focus")
                        .font(.headline)
                        .foregroundStyle(Color.defaultText)
                        .opacity(showNavTitle ? 1 : 0)
                        .animation(.easeInOut(duration: 0.2), value: showNavTitle)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button { } label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(Color.defaultText)
                    }
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: TaskItem.self, configurations: config)

    let now = Date()
    let cal = Calendar.current

    // Priority Focus — deadline still ahead today (small offsets, never cross midnight)
    let upcoming: [TaskItem] = [
        TaskItem(
            title: "Refactor Identity Module",
            taskDescription: "Clean up the core authentication logic for the next sprint.",
            priority: .high,
            deadline: cal.date(byAdding: .minute, value: 5, to: now)!
        ),
        TaskItem(
            title: "Quarterly Review",
            taskDescription: "Align current progress with the Monastic Precision goals.",
            priority: .low,
            deadline: cal.date(byAdding: .minute, value: 10, to: now)!,
            repeatFrequency: .weekly
        ),
        TaskItem(
            title: "Morning Journaling",
            taskDescription: "Reflect on yesterday and set intention for today.",
            priority: .medium,
            deadline: cal.date(byAdding: .minute, value: 15, to: now)!,
            repeatFrequency: .daily
        ),
        TaskItem(
            title: "Read 30 Pages",
            taskDescription: "Continue Deep Work by Cal Newport.",
            priority: .low,
            deadline: cal.date(byAdding: .minute, value: 20, to: now)!
        ),
        TaskItem(
            title: "Design System Audit",
            taskDescription: "Review all component tokens against Figma source.",
            priority: .medium,
            deadline: cal.date(byAdding: .minute, value: 25, to: now)!
        ),
    ]

    // Urgent — already past deadline
    let overdue: [TaskItem] = [
        TaskItem(
            title: "Server Migration",
            priority: .high,
            deadline: cal.date(byAdding: .hour, value: -1, to: now)!
        ),
        TaskItem(
            title: "Client Sync",
            priority: .high,
            deadline: cal.date(byAdding: .minute, value: -20, to: now)!
        ),
        TaskItem(
            title: "Submit Budget Report",
            priority: .medium,
            deadline: cal.date(byAdding: .day, value: -1, to: now)!
        ),
    ]

    let sampleTasks = upcoming + overdue
    sampleTasks.forEach { container.mainContext.insert($0) }

    return FocusView()
        .modelContainer(container)
}
