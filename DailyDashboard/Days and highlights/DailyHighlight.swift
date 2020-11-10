//
//  DailyHighlight.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 02/11/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation

struct DailyHighlight: Identifiable, Codable {
    var id = UUID()
    var task = "Alexander"
    var day: Day
    
    init(task: String, day: Day) {
        self.task = task
        self.day = day
    }
    
    func encoded() -> Data? {
        let encoded = try? JSONEncoder().encode(self)
        return encoded
    }
    
    static func decoded(from data: Data) -> DailyHighlight? {
        return try? JSONDecoder().decode(DailyHighlight.self, from: data)
    }
}
