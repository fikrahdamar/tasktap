//
//  CustomTabBar.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 24/03/26.
//

import SwiftUI

private typealias Tokens = DesignTokens

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    var onPlusClick: () -> Void

    @State private var tabWidths: [Tab: CGFloat] = [:]
    @State private var barHeight: CGFloat = 0

    private func offsetForTab(_ tab: Tab) -> CGFloat {
        let allCases = Tab.allCases
        guard let index = allCases.firstIndex(of: tab) else { return 0 }
        return allCases.prefix(index).reduce(0) { $0 + (tabWidths[$1] ?? 0) }
    }

    var body: some View {
        GeometryReader { geo in
            let tabSize = geo.size.width * Tokens.TabBar.tabSizePercent
            let plusSize = geo.size.width * Tokens.TabBar.plusSizePercent
            let iconSize = tabSize * 0.3
            let textSize = tabSize * 0.16

            HStack(spacing: geo.size.width * Tokens.TabBar.spacingPercent) {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: Tokens.Radius.tabBar)
                        .fill(Color.black)
                        .frame(width: tabWidths[selectedTab] ?? 0, height: barHeight)
                        .offset(x: offsetForTab(selectedTab))
                        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: selectedTab)

                    HStack(spacing: 0) {
                        ForEach(Tab.allCases) { tab in
                            tabButton(tab: tab, tabSize: tabSize, iconSize: iconSize, textSize: textSize)
                                .onGeometryChange(for: CGFloat.self) { proxy in
                                    proxy.size.width
                                } action: { newWidth in
                                    tabWidths[tab] = newWidth
                                }
                        }
                    }
                }
                .fixedSize()
                .onGeometryChange(for: CGFloat.self) { proxy in
                    proxy.size.height
                } action: { newHeight in
                    barHeight = newHeight
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.tabBar))
                .shadow(color: Tokens.Shadow.color, radius: Tokens.Shadow.radius, x: Tokens.Shadow.x, y: Tokens.Shadow.y)

                Button(action: onPlusClick) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: plusSize, height: plusSize)
                            .shadow(color: Tokens.Shadow.color, radius: Tokens.Shadow.radius, x: Tokens.Shadow.x, y: Tokens.Shadow.y)

                        Image(systemName: "plus")
                            .font(.system(size: plusSize * 0.45, weight: .light))
                            .foregroundColor(.black)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, Tokens.TabBar.bottomPadding)
        }
        .frame(height: Tokens.TabBar.height)
    }

    func tabButton(tab: Tab, tabSize: CGFloat, iconSize: CGFloat, textSize: CGFloat) -> some View {
        Button {
            withAnimation(.spring()) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: tab.iconName)
                    .font(.system(size: iconSize))
                    .imageScale(.medium)
                    .frame(width: iconSize, height: iconSize)
                Text(tab.title)
                    .font(.system(size: textSize, weight: .medium))
            }
            .frame(width: tabSize, height: tabSize)
            .foregroundColor(selectedTab == tab ? .white : .black)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()

        CustomTabBar(selectedTab: .constant(.focus)) {}
    }
}
