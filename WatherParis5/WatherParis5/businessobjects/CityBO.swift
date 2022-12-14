//
//  CityBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct CityBO {
    let id: Int
    let name: String
    let coord: CoordinateBO
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
}

extension CityObject {
    func toBO() -> CityBO{
        return CityBO(
            id: self.id,
            name: self.name,
            coord: self.coord?.toBO() ?? CoordinateBO(lat: 0.0, lon: 0.0),
            country: self.country,
            population: self.population,
            timezone: self.timezone,
            sunrise: self.sunrise,
            sunset: self.sunset
        )
    }
}
