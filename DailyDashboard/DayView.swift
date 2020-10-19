//
//  DayView.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 18/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import SwiftUI

struct DayView: View {
    var body: some View {
        
        VStack {
            Text("Monday")
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
                .font(.custom(glamour, size: 32))
                .padding(40)
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(akBeige)
                    .padding(8)
                Text("Set a highlight".uppercased())
                    .multilineTextAlignment(.center)
                    .foregroundColor(akBlack)
                    .font(.custom(futuraBold, size: 16))
                    .opacity(0.4)
            }.frame(width: 200, height: 60, alignment: .center)
            .gesture(
                TapGesture()
                    .onEnded({ (_) in
                        print("TODO: Add highlight to this day")
                    })
            )
        }.frame(width: 200, height: 400, alignment: .center)
        .background(Color.white)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
