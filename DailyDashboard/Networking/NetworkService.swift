//
//  NetworkManager.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 09/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation

enum NetworkServiceError: String, Error {
    case testError = "This is just a test"
    case couldNotUnwrap = "Could not unwrap response"
}

final class NetworkService {
    
    // MARK: Methods
    
    func GET(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(Result.failure(NetworkServiceError.testError))
                return
            }

            guard let data = data else {
                completion(Result.failure(NetworkServiceError.couldNotUnwrap))
                return
            }
            
            completion(Result.success(data))
            return
        }
        task.resume()
    }
}
