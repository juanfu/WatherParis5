//
//  WeatherInfoRepository.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

protocol WeatherInfoRepositoryProtocol {
    func fetchWeather(completion: @escaping (ResponseBO) -> Void)
}

class WeatherInfoRepository: WeatherInfoRepositoryProtocol {
    func fetchWeather(completion: @escaping (ResponseBO) -> Void) {
        // return cached data
        let model = DatabaseManager.shared.getData()
        
        if let model = model {
            completion(model.toBO())
        }
        
        // fetch remote data
        FetchWeatherAPI().fetchWeather { error in
            if let error = error {
                print(error)
            } else {
                let model = DatabaseManager.shared.getData()
                if let model = model {
                    completion(model.toBO())
                }
            }
        }
    }
}
