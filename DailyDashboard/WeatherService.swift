//
//  WeatherService.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 10/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation
import CoreLocation

final class WeatherService: NSObject {
    
    // Properties
    
    private let networkService: NetworkService
    
    // Initializers
    
    init(_ networkService: NetworkService) {
        self.networkService = networkService
        super.init()
    }
    
    // Methods
    
    func getWeather(for location: CLLocation) {
        print("would try to get location for: ", location)
    }
}
