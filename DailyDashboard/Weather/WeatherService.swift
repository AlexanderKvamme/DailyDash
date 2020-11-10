//
//  WeatherService.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 10/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation
import CoreLocation

enum WeatherError: String, Error {
    case couldNotDecode = "Could not decode weather"
}


final class WeatherService: NSObject {
    
    // Properties
    
    private let networkService: NetworkService
    
    // Initializers
    
    init(_ networkService: NetworkService) {
        self.networkService = networkService
        super.init()
    }
    
    // Methods
    
    func getCompactWeather(for location: CLLocation, completion: @escaping  (Result<YrCompactResponse, Error>) -> ()) {
        let c = location.coordinate
        if let url = URL(string: "https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=\(c.latitude)&lon=\(c.longitude)") {
            networkService.GET(url: url) { (result) in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let res):
                    do {
                        let weather: YrCompactResponse = try self.decodeWeather(data: res)
                        completion(.success(weather))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    func decodeWeather<T: Codable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            print("bam data: ", String(decoding: data, as: UTF8.self))
            let decoded = try decoder.decode(T.self, from: data)
            // FIXME: Handle successfull decoding
            print("Succesfully decoded ", T.self)
            print("Successsfully decoded: ", decoded)
            return decoded as T
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
        
        throw WeatherError.couldNotDecode
    }
}

