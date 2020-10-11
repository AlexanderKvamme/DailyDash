//
//  AppDelegate.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 04/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: Properties
    
    var window: NSWindow!
    let locationService = LocationService.shared
    let networkService = NetworkService()
    var weatherService: WeatherService!

    // MARK: Delegate methods

    func setVC<T: View>(_ v: T) {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 100),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: v)
        window.makeKeyAndOrderFront(nil)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Request location
        locationService.setDelegate(self)
        locationService.start()
        
        // Request weather
        weatherService = WeatherService(networkService)
        weatherService!.getCompactWeather(for: locationService.getUserLocation()) { (result) in
            do {
                let res = try result.get()
                DispatchQueue.main.async {
                    let v = MainScreenContentView(currentWeather: res)
                    self.setVC(v)
                }
            } catch {
                fatalError("outmost catch: \(error) \(error.localizedDescription)")
            }
        }
    }
}

// MARK: Delegate methods for LocationService

extension AppDelegate: LocationServiceDelegate {
    func updateLocation(to location: CLLocation) {
        UserDefaults.standard.setValue(location.coordinate.latitude, forKeyPath: "latitude")
        UserDefaults.standard.setValue(location.coordinate.longitude, forKeyPath: "longitude")
    }
}
