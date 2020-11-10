//
//  LocationService.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 10/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation
import CoreLocation
import AppKit

protocol LocationServiceDelegate {
    func updateLocation(to: CLLocation)
}

final class LocationService: NSObject, CLLocationManagerDelegate {
    
    // Singleton
    
    static let shared = LocationService()
    private override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // Properties
    
    private let locationManager = CLLocationManager()
    private var delegate: LocationServiceDelegate? = nil
    
    // MARK: Private methods
    
    @objc func requestAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MARK: Public methods
    
    func setDelegate(_ delegate: LocationServiceDelegate) {
        self.delegate = delegate
    }
    
    func start() {
        print("start")
        if locationManager.authorizationStatus != .authorized {
            alertUserForLocation()
        } else {
            locationManager.requestLocation()
        }
    }
    
    // Delegate methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            delegate?.updateLocation(to: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        let ud = UserDefaults.standard
        if ud.value(forKey: "latitude") == nil || ud.value(forKey: "longitude") == nil {
            print("Setting default location to Oslo")
            ud.setValue(59.91273, forKeyPath: "latitude")
            ud.setValue(10.74609, forKeyPath: "longitude")
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("didChangeAuth to: ", manager.authorizationStatus)
        if manager.authorizationStatus == .authorized {
            start()
        } else {
            alertUserForLocation()
        }
    }
    
    func getUserLocation() -> CLLocation {
        let ud = UserDefaults.standard
        guard ud.value(forKey: "latitude") != nil && ud.value(forKey: "longitude") != nil  else {
            let latitudeOslo = 59.91273
            let longitudeOslo = 10.74609
            ud.setValue(latitudeOslo, forKeyPath: "latitude")
            ud.setValue(longitudeOslo, forKeyPath: "longitude")
            return CLLocation(latitude: latitudeOslo, longitude: longitudeOslo)
        }
        
        return CLLocation(latitude: ud.double(forKey: "latitude"), longitude: ud.double(forKey: "longitude"))
    }
    
    // TODO: Implement ccompletionhandler
    func alertUserForLocation() {
        let alert = NSAlert()
        alert.messageText = "Need location to fetch weather"
        alert.informativeText = "Please accept"
        alert.alertStyle = NSAlert.Style.warning
        let okButton = alert.addButton(withTitle: "Allow location")
        okButton.target = self
        okButton.action = #selector(requestAuthorization)
        alert.addButton(withTitle: "Cancel")
        alert.runModal()
    }
}
