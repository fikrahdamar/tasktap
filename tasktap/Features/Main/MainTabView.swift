//
//  MainTabView.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 25/03/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    @State private var showingAddTask = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home: HomeView()
                case .stats: HomeView()
                case .calendar:  HomeView()
                case .profile:  HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

          
            CustomTabBar(selectedTab: $selectedTab) {
                showingAddTask = true
            }
        }
        
        .sheet(isPresented: $showingAddTask) {
            Text("Add Task View Here")
        }
    }
}

#Preview {
    MainTabView()
}
