//
//  MasteryMilestoneCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 24/04/26.
//

import SwiftUI

struct MasteryMilestoneCard: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                }
                Text("7-Day Ritual Master")
                Text("Consistency Achievement".uppercased())
               
            }
            .padding(10)
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * DesignTokens.Card.mainCardWidth)
            .background(Color.card)
            .clipShape(RoundedRectangle(cornerRadius: DesignTokens.Radius.card))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
       
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        MasteryMilestoneCard()
    }
    
}
