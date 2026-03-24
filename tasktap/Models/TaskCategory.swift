//
//  TaskCategory.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 24/03/26.
//

import Foundation
import SwiftData

@Model
final class TaskCategory: Equatable {
    @Attribute(.unique) var id: UUID
    var name: String
    var iconName: String
    var colorHex: String
    var categoryDescription: String?

    @Relationship(deleteRule: .nullify, inverse: \TaskItem.category)
    var tasks: [TaskItem]?

    init(
        name: String,
        iconName: String,
        colorHex: String,
        categoryDescription:String? = nil
    ){
        self.id = UUID()
        self.name = name
        self.iconName = iconName
        self.colorHex = colorHex
        self.categoryDescription = categoryDescription
        self.tasks = []
    }
}
