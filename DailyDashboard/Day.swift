//
//  Day.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 02/11/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation


struct Day: Codable {
    let day: Int
    let month: Int
    let year: Int
    
    static var random: Day {
        let d = Int.random(in: 0...30)
        let m = Int.random(in: 0...12)
        let y = Int.random(in: 1900...2020)
        return Day(day: d, month: m, year: y)
    }
    
    func toDate() -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = self.year
        dateComponents.month = self.month
        dateComponents.day = self.day
        return Calendar.current.date(from: dateComponents)!
    }
    
    func toString() -> String {
         return "day \(day)"
    }
}
