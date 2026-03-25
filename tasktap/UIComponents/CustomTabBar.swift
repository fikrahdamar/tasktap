//
//  CustomTabBar.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 24/03/26.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    var onPlusClick: () -> Void

    var body: some View {
        HStack(spacing: 20) {
            HStack(spacing: 0) {
                ForEach(Tab.allCases) { tab in
                    tabButton(tab: tab)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)

            Button(action: onPlusClick) {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)

                    Image(systemName: "plus")
                        .font(.system(size: 30, weight: .light))
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.bottom, 30)
    }

    func tabButton(tab: Tab) -> some View {
        Button {
            withAnimation(.spring()) {
                selectedTab = tab
            }
        } label: {
            Image(systemName: tab.iconName)
                .font(.system(size: 20))
                .frame(width: 60, height: 60)
                .foregroundColor(selectedTab == tab ? .white : .black)
                .background(selectedTab == tab ? Color.black : Color.white)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()

        CustomTabBar(selectedTab: .constant(.home)) {
            print("Plus clicked!")
        }
    }
}
