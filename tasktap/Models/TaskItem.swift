//
//  TaskItem.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 23/03/26.
//

import Foundation
import SwiftData

enum Priority: Int, Codable, Equatable {
    case low = 1
    case medium = 2
    case high = 3

    var title: String {
        switch self {
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
}

enum RepeatFrequency: String, Codable, Equatable {
    case none = "None"
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
}

@Model
final class TaskItem: Equatable {
    @Attribute(.unique) var id: UUID
    var title: String
    var taskDescription: String?
    var priority: Priority
    var deadline: Date
    var notes: String?

    var isCompleted: Bool
    var completedAt: Date?
    var postponeCount: Int
    var createdAt: Date

    var repeatFrequency: RepeatFrequency = RepeatFrequency.none
    var repeatInterval: Int = 1
    var repeatEndDate: Date?
    var originalDeadline: Date

    var category: TaskCategory?
    @Attribute(.externalStorage) var attachment: Data?

    init(title: String,
         taskDescription: String? = nil,
         priority: Priority = .low,
         deadline: Date,
         notes: String? = nil,
         repeatFrequency: RepeatFrequency = .none,
         repeatInterval: Int = 1,
         repeatEndDate: Date? = nil,
         attachment: Data? = nil,
         isCompleted: Bool = false,
         completedAt: Date? = nil,
         postponeCount: Int = 0)
    {
        self.id = UUID()
        self.title = title
        self.taskDescription = taskDescription
        self.priority = priority
        self.deadline = deadline
        self.notes = notes

        self.isCompleted = isCompleted
        self.completedAt = completedAt
        self.postponeCount = postponeCount
        self.createdAt = .now

        self.originalDeadline = deadline
        self.repeatFrequency = repeatFrequency
        self.repeatInterval = repeatInterval
        self.attachment = attachment

        if repeatFrequency != .none, repeatEndDate == nil {
            self.repeatEndDate = Calendar.current.date(byAdding: .year, value: 1, to: deadline)
        } else {
            self.repeatEndDate = repeatEndDate
        }
    }
}
