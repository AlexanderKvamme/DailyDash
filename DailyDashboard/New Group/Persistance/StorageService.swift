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
    static func putHighlight(_ hl: DailyHighlight) {
        guard let dateKey = getHighlightKey(from: hl) else {
            print("Could not get datekey to put highlight")
            return
        }
        
        UserDefaults.standard.set(hl.encoded(), forKey: dateKey)
    }
    
    static func getHighlight(day: Day) -> DailyHighlight? {
        let key = makeKey(for: day)
        if let data = UserDefaults.standard.data(forKey: key) {
            if let hl = try? JSONDecoder().decode(DailyHighlight.self, from: data) {
                return hl
            }
        }
        return nil
    }
    
    // Helper methods
    
    private static func makeKey(for day: Day) -> String {
        "daily-highlight-\(day.day)-\(day.month)-\(day.year)"
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
