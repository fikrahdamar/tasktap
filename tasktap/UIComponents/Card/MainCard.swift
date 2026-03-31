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
            VStack (spacing: 30){
                HStack {
                    Text("DEEP WORK")
                    Spacer()
                    Image(systemName: "circle.circle")
                }
                .bold()
                .foregroundStyle(Color.brown)
                VStack (alignment: .leading){
                    Text("Refactor Identity Module")
                    Text("Clean up the core authentication logic for the next sprint.")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    HStack{
                        Image(systemName: "clock")
                        Text("1h 30m").bold()
                    }
                    HStack{
                        Image(systemName: "exclamationmark")
                        Text("High Priority")
                    }
                    .bold()
                    Spacer()
                }
                
            }
            .padding(.horizontal,25)
            .padding(.vertical, 20)
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
