//
//  Tab.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 24/03/26.
//

import Foundation

enum Tab: String, CaseIterable, Identifiable {
    case home
    case stats
    case calendar
    case profile
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .stats: return "chart.bar"
        case .calendar: return "calendar"
        case .profile: return "person"
        }
    }
}
