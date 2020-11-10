//
//  PersistanceService.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 01/11/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation
import AppKit


final class StorageService {
    
    /// Highlights are stored as arrays cause there can be multiples for a day (One for each category)
    static func putHighlightArray(arr: [DailyHighlight], for day: Day) {
        let key = makeKey(for: day)
        if let encoded = try? JSONEncoder().encode(arr) {
            UserDefaults.standard.set(encoded, forKey: key)
        } else {
            print("Error: could not encode highlights. Nothing put to storage")
        }
    }
    
    static func getHighlightArray(forDay day: Day) -> [DailyHighlight] {
        let key = makeKey(for: day)
        do {
            let res = UserDefaults.standard.object(forKey: key)
            if let data = res as? Data {
                let res = try JSONDecoder().decode([DailyHighlight].self, from: data)
                return res
            }
        } catch let err {
            print("Error: could not getHighlights: ", err)
        }
        return []
    }
    
    static func makeKey(for date: Date) -> String {
        return StorageService.makeKey(for: date.toDay())

    }
    
    // MARK: Helper methods
    
    private static func makeKey(for day: Day) -> String {
        let key = "daily-highlight-\(day.day)-\(day.month)-\(day.year)"
        return key
    }
    
    private static func getHighlightKey(from hl: DailyHighlight) -> String? {
        let comps = Calendar.current.dateComponents(Set<Calendar.Component>([.day, .month, .year, .weekOfYear]), from: hl.day.toDate())
        guard let d = comps.day, let m = comps.month, let y = comps.year else { return nil }
        return makeKey(for: Day(day: d, month: m, year: y))
    }
    
    static func wipe() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
}
