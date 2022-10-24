//
//  CityDTO.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation

struct CityDTO: Codable {
    let id: Int
    let name: String
    let coord: CoordinateDTO
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coord
        case country
        case population
        case timezone
        case sunrise
        case sunset
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.coord = try container.decode(CoordinateDTO.self, forKey: .coord)
        self.country = try container.decode(String.self, forKey: .country)
        self.population = try container.decode(Int.self, forKey: .population)
        self.timezone = try container.decode(Int.self, forKey: .timezone)
        self.sunrise = try container.decode(Int.self, forKey: .sunrise)
        self.sunset = try container.decode(Int.self, forKey: .sunset)
    }
}
