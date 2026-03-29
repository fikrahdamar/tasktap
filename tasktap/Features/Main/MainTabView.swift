//
//  MainTabView.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 25/03/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .focus
    @State private var showingAddTask = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .focus: FocusView()
                case .discipline: DisciplineView()
                case .ritual:  RitualView()
                case .identity:  IdentityView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

          
            CustomTabBar(selectedTab: $selectedTab) {
                showingAddTask = true
            }
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView()
        }
    }
}

#Preview {
    MainTabView()
}
