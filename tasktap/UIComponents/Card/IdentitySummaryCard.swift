//
//  IdentitySummaryCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 23/04/26.
//

import SwiftUI

struct IdentitySummaryCard: View {
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .leading, spacing: 14){
                Image(systemName: "flame")
                    .foregroundStyle(Color.redIconAccent)
                Text("14 Days")
                    .foregroundStyle(Color.defaultText)
                    .font(Font.custom("Inter-bold", size: 24))
                Text("Current Streak".uppercased())
                    .foregroundStyle(Color.greyText)
                    .font(Font.custom("Inter-Bold", size: 12))
            }
            .padding(20)
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * 0.45)
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        IdentitySummaryCard()
    }
}
