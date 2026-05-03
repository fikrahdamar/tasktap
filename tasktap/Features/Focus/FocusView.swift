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

    private let calendar = Calendar.current

    // All tasks with deadline today
    private var todayAll: [TaskItem] {
        tasks.filter { calendar.isDateInToday($0.deadline) }
    }

    // Today's incomplete tasks sorted high → low priority
    private var priorityTasks: [TaskItem] {
        todayAll
            .filter { !$0.isCompleted }
            .sorted { $0.priority.rawValue > $1.priority.rawValue }
    }

    // Overdue incomplete tasks (past deadline, any day)
    private var urgentTasks: [TaskItem] {
        tasks.filter { !$0.isCompleted && $0.deadline <= Date() }
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
                .padding(.bottom, Tokens.TabBar.height)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Daily Focus")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("TaskTap")
                        .font(.inter(.black, size: 20))
                        .foregroundStyle(Color.defaultText)
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

    let sampleTasks: [TaskItem] = [
        TaskItem(
            title: "Refactor Identity Module",
            taskDescription: "Clean up the core authentication logic for the next sprint.",
            priority: .high,
            deadline: Date()
        ),
        TaskItem(
            title: "Quarterly Review",
            taskDescription: "Align current progress with the Monastic Precision goals.",
            priority: .low,
            deadline: Date(),
            repeatFrequency: .weekly
        ),
        TaskItem(
            title: "Server Migration",
            priority: .high,
            deadline: Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
        ),
        TaskItem(
            title: "Client Sync",
            priority: .high,
            deadline: Calendar.current.date(byAdding: .minute, value: -20, to: Date())!
        ),
    ]
    sampleTasks.forEach { container.mainContext.insert($0) }

    return FocusView()
        .modelContainer(container)
}
