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
    var weatherService: WeatherService?

    // MARK: Delegate methods

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 100),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        // Request location
        locationService.setDelegate(self)
        locationService.start()
        
        weatherService = WeatherService(networkService)
        
        // Test data
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let data = Data(YrCompactResponse.dummy.utf8)
        do {
            let decoded = try decoder.decode(YrCompactResponse.self, from: data)
            
            // TODO: Handle successfull decoding
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath a:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath b:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath c:", context.codingPath)
        } catch {
            print("error: \(error) - \(error.localizedDescription)")
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
