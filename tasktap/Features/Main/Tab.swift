//
//  Tab.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 24/03/26.
//

import Foundation

enum Tab: String, CaseIterable, Identifiable {
    case focus
    case discipline
    case ritual
    case identity
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .focus: return "circle.hexagonpath"
        case .discipline: return "chart.bar.horizontal.page"
        case .ritual: return "calendar"
        case .identity: return "medal.star"
        }
    }
    
    var title: String {
        switch self {
        case .focus: return "Focus"
        case .discipline: return "Discipline"
        case .ritual: return "Ritual"
        case .identity: return "Identity"
        }
    }
}
