//
//  WeatherInfoRepository.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

protocol WeatherInfoRepositoryProtocol {
    func fetchWeather() -> ResponseBO
}

class WeatherInfoRepository: WeatherInfoRepositoryProtocol {
    func fetchWeather() -> ResponseBO {
        
        return ResponseBO(
            list: [WeatherListItemBO](),
            city: CityBO(
                id: 123,
                name: "Crevillente",
                coord: CoordinateBO(lat: 13.1423, lon: -0.34),
                country: "Spain",
                population: 1,
                timezone: 1,
                sunrise: 2,
                sunset: 2
            )
        )
    }
}
