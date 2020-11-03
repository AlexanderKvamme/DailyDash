//
//  TestSwiftUIView.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 01/11/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import SwiftUI
import AppKit
import Introspect

struct WeeklyTestView: View {

    @State var highLights = [DailyHighlight]()
    @State var isFR = true
    
    init() {
        for key in Array(UserDefaults.standard.dictionaryRepresentation().keys) {
            print("Key in UserDefaults: ", key)
//            if key.contains("") {
//                UserDefaults.standard.removeObject(forKey: key)
//            }

        }
    }
    
    var body: some View {
        VStack {
              HStack {
                ForEach(0..<7) { i in
                    let testDay = Day(day: i, month: i, year: i)
                    DayView(day: testDay)
                    Divider().frame(width: 16, height: 0, alignment: .center)
                }
              }
            .frame(height: 100)
            .background(Color.red)
        }.frame(width: 2000, height: 300, alignment: .center)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyTestView()
    }
}
