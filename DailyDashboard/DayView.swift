//
//  DayView.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 18/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import SwiftUI
import AppKit
import Introspect


struct DailyHighlight: Identifiable {
    var id = UUID()
    var task = "Alexander"
}

struct DayView: View {

    private var viewWidth: CGFloat = 240
    private var day = ""
    @State var highLights = [DailyHighlight]()
    @State var text = ""
    @State var isFR = true
    @State var isInputtingHighlight = false
    
    init(day: String) {
        self.day = day
    }
    
    var body: some View {
        VStack {
            Text(day)
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
                .font(.custom(glamour, size: 32))
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            List(highLights) { highlight in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(akBeige)
                    Text(String(highlight.task))
                        .multilineTextAlignment(.center)
                        .foregroundColor(akBlack)
                        .font(.custom(futuraBold, size: 16))
                }
                .frame(width: viewWidth-32, height: 40, alignment: .center)
                .padding(0)
            }
            .padding(0)
            .listStyle(SidebarListStyle())
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(akBeige)
                    .padding(16)
                Button("SET A HIGHLIGHT", action: {
                    isInputtingHighlight = true
                })
                    .multilineTextAlignment(.center)
                    .foregroundColor(akBlack)
                    .font(.custom(futuraBold, size: 16))
                    .opacity(0.4)
                .padding(20)
                .buttonStyle(BorderlessButtonStyle())
                // Show textfield over button of isInput
                if isInputtingHighlight {
                    TextField("Input", text: $text, onCommit:  {
                        highLights.append(DailyHighlight(task: text))
                        isInputtingHighlight = false
                        text = ""
                    })
                    .textCase(.uppercase)
                    .font(.custom(futuraBold, size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(akWhite)
                    .background(akBlack)
                } else {
                    // Make invis
                    TextField("Input", text: $text, onCommit: {
                        highLights.append(DailyHighlight(task: text))
                        isInputtingHighlight = false
                    })
                    .textCase(.uppercase)
                    .font(.custom(futuraBold, size: 24))
                    .multilineTextAlignment(.center)
                    .opacity(0.2)
                }
            }.frame(width: viewWidth, height: 80, alignment: .center)
            .padding(0)
        }.frame(width: viewWidth, height: 300, alignment: .center)
        .background(akWhiter)
        .cornerRadius(20)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(day: "Test Day")
    }
}
