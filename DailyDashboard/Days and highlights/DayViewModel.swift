//
//  DayViewModel.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 27/12/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation
import Combine

class DayViewModel: ObservableObject {

    private var highlightsCancellable: AnyCancellable? // Observes database changes to highlights of this day
    
    @Published var day: Day
    @Published var highlights = [Highlight]()
    
    init(_ day: Day) {
        self.day = day
        self.highlightsCancellable = StorageService.highlightsForDayPublisher(day: day)
            .sink(receiveCompletion: { (completion) in
                print("TODO: Handle highlightsCancellable completion")
            }, receiveValue: { (values) in
                self.highlights = values
            })
    }
}
