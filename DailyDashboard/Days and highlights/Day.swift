//
//  Day.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 02/11/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation


struct Day: Identifiable, Codable {
    let day: Int
    let month: Int
    let year: Int
    var id = UUID()
    
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
    
    func weekdayString() -> String {
        let date = self.toDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
}

extension Day {
    static var random: Day {
        let d = Int.random(in: 0...30)
        let m = Int.random(in: 0...12)
        let y = Int.random(in: 1900...2020)
        return Day(day: d, month: m, year: y)
    }
}
