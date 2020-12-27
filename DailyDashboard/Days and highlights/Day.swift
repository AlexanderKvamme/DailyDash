import Foundation
import GRDB

struct Day: Identifiable, Codable, PersistableRecord, FetchableRecord {
    var id: String = UUID().uuidString
    
    static var databaseTableName: String { "days" }
    
    let day: Int
    let month: Int
    let year: Int
    var key: String
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
        self.key = "daily-highlight-\(day)-\(month)-\(year)"
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
    
    func toKey() -> String {
        return "daily-highlight-\(day)-\(month)-\(year)"
    }
    
    static func from(key: String) -> Day? {
        let split = key.split(separator: "-")
        guard let d = Int(split[2]),
              let m = Int(split[3]),
              let y = Int(split[4]) else { return nil }
        
        let day = Day(day: d, month: m, year: y)
        return day
    }
    
    func weekdayString() -> String {
        let date = self.toDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
    
    static func daysOfWeek() -> [Day] {
        Date.getCurrentWeek().map({$0.toDay()})
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
