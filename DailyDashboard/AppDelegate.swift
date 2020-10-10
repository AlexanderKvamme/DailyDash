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
    }
}

// MARK: Delegate methods for LocationService

extension AppDelegate: LocationServiceDelegate {
    func updateLocation(to location: CLLocation) {
        UserDefaults.standard.setValue(location.coordinate.latitude, forKeyPath: "latitude")
        UserDefaults.standard.setValue(location.coordinate.longitude, forKeyPath: "longitude")
    }
}
