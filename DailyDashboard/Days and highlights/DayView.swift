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



struct DayView: View {

    static let size = NSSize(width: 240, height: 300)
    
    @ObservedObject var viewModel: DayViewModel
    @State var text = ""
    @State var isFR = true
    @State var isInputtingHighlight = false
    
    init(viewModel: DayViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text($viewModel.day.wrappedValue.weekdayString())
                .multilineTextAlignment(.center)
                .foregroundColor(akBlack)
                .font(.custom(glamour, size: 32))
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            List($viewModel.highlights.wrappedValue) { highlight in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(akBeige)
                    Text(String(highlight.task))
                        .multilineTextAlignment(.center)
                        .foregroundColor(akBlack)
                        .font(.custom(futuraBold, size: 16))
                }
                .frame(width: DayView.size.width-32, height: 40, alignment: .center)
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
                        $viewModel.highlights.wrappedValue.append(DailyHighlight(task: text, day: Date().toDay()))
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
                        $viewModel.highlights.wrappedValue.append(DailyHighlight(task: text, day: Date().toDay()))
                        isInputtingHighlight = false
                    })
                    .textCase(.uppercase)
                    .font(.custom(futuraBold, size: 24))
                    .multilineTextAlignment(.center)
                    .opacity(0.2)
                }
            }.frame(width: DayView.size.width, height: 80, alignment: .center)
            .padding(0)
        }.frame(width: DayView.size.width, height: DayView.size.height, alignment: .center)
        .background(akWhiter)
        .cornerRadius(20)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        let day = Day.random
        DayView(viewModel: DayViewModel(day))
    }
}