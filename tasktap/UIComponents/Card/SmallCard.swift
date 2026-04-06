//
//  SmallCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 02/04/26.
//

import SwiftUI

struct SmallCard: View {
    var body: some View {
        GeometryReader { geo in
            HStack (spacing: 0){
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.darkRedAccent)
                    .frame(width: 6)
                
                VStack (alignment: .leading, spacing: 20)  {
                    Text("DUE NOW")
                        .font(Font.custom("Inter-Black", size: 12))
                        .foregroundStyle(Color.darkRedAccent)
                    Text("Ngumpulin tugas Prototype")
                        .font(Font.custom("Inter-Black", size: 14))
                        .foregroundStyle(Color.greyDarkText)
                    HStack {
                        Text("10:30 AM")
                            .font(Font.custom("Inter-Black", size: 12))
                            .foregroundStyle(Color.greyText)
                        Spacer()
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.darkRedAccent)
                            .frame(width: 12, height: 12)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * 0.55)
            .background(Color.cardSmall)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(maxWidth: .infinity, maxHeight: .infinity )
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        SmallCard()
    }
}
