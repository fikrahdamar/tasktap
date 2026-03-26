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

    @State private var tabWidths: [Tab: CGFloat] = [:]
    private func offsetForTab(_ tab: Tab) -> CGFloat {
        let allCases = Tab.allCases
        guard let index = allCases.firstIndex(of: tab) else { return 0 }
        return allCases.prefix(index).reduce(0) { $0 + (tabWidths[$1] ?? 0) }
    }

    var body: some View {
        HStack(spacing: 20) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.black)
                    .frame(width: tabWidths[selectedTab] ?? 0, height: 60)
                    .offset(x: offsetForTab(selectedTab))
                    .animation(.spring(response: 0.35, dampingFraction: 0.8), value: selectedTab)

                HStack(spacing: 0) {
                    ForEach(Tab.allCases) { tab in
                        tabButton(tab: tab)
                            .onGeometryChange(for: CGFloat.self) { proxy in
                                proxy.size.width
                            } action: { newWidth in
                                tabWidths[tab] = newWidth
                            }
                    }
                }
            }
            .fixedSize() 
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
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()

        CustomTabBar(selectedTab: .constant(.home)) {}
    }
}
