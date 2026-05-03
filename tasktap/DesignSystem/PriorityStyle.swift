//
//  PriorityStyle.swift
//  tasktap
//

import SwiftUI

extension Priority {
    /// Left accent bar in cards (RoundedRectangle fill)
    var accentColor: Color {
        switch self {
        case .high:   return Color.darkRedAccent
        case .medium: return Color.brownAccent
        case .low:    return Color.darkBlueAccent
        }
    }

    /// Icon foreground color
    var iconColor: Color {
        switch self {
        case .high:   return Color.redIconAccent
        case .medium: return Color.orangeIconAccent
        case .low:    return Color.blueIconAccent
        }
    }

    /// Circle/rectangle background behind icon
    var iconBgColor: Color {
        switch self {
        case .high:   return Color.redIconBgAccent
        case .medium: return Color.orangeIconBgAccent
        case .low:    return Color.blueIconBgAccent
        }
    }

    /// UI display label
    var displayLabel: String {
        switch self {
        case .high:   return "Urgent"
        case .medium: return "Focus"
        case .low:    return "Flow"
        }
    }
}

extension TaskItem {
    /// Card type label derived at render time — never stored
    var typeLabel: String {
        if repeatFrequency != .none { return "RITUAL" }
        if priority == .high { return "DEEP WORK" }
        return "INTENTION"
    }
}
