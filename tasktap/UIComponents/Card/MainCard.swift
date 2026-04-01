//
//  MainCard.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 31/03/26.
//

import SwiftUI

struct MainCard: View {
    var body: some View {
        GeometryReader { geo in
            HStack {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.brownAccent)
                    .frame(width: 6)

                VStack(spacing: 30) {
                    
                    HStack {
                        Text("DEEP WORK")
                        Spacer()
                        Image(systemName: "circle.circle")
                    }
                    .font(Font.custom("Inter-Medium", size: 12))
                    .bold()
                    .foregroundStyle(Color.brownAccent)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Refactor Identity Module")
                            .font(Font.custom("Inter-Bold", size: 18))
                        Text("Clean up the core authentication logic for the next sprint.")
                            .font(Font.custom("Inter-Regular", size: 14))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        HStack {
                            Image(systemName: "clock")
                            Text("1h 30m")
                               
                        }
                        .font(Font.custom("Inter-bold", size: 12))
                        HStack {
                            Image(systemName: "exclamationmark")
                            Text("High Priority")
                        }
                        .font(Font.custom("Inter-bold", size: 12))
                        .bold()
                        Spacer()
                    }.foregroundStyle(Color.greyText)
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 20)

            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: geo.size.width * 0.90)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()

        MainCard()
    }
}
