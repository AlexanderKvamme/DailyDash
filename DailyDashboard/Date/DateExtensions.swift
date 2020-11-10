//
//  DateExtensions.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 08/11/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation


extension Date {
    
    func toDay() -> Day {
        let comps = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return Day(day: comps.day!, month: comps.month!, year: comps.year!)
    }
    
    static func getCurrentWeek() -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        let dayOfWeek = calendar.component(.weekdayOrdinal, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
        
        let df = DateFormatter()
        df.dateStyle = .short
        for d in days {
            print("bam made day: ", df.string(from: d))
        }
        return days
    }
}
