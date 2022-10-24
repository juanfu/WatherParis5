//
//  MainDTO.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation


struct MainDTO: Codable {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Int
    let sea_level: Int
    let grnd_level: Int
    let humidity: Int
    let temp_kf: Float
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feels_like
        case temp_min
        case temp_max
        case pressure
        case sea_level
        case grnd_level
        case humidity
        case temp_kf
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try container.decode(Float.self, forKey: .temp)
        self.feels_like = try container.decode(Float.self, forKey: .feels_like)
        self.temp_min = try container.decode(Float.self, forKey: .temp_min)
        self.temp_max = try container.decode(Float.self, forKey: .temp_max)
        self.pressure = try container.decode(Int.self, forKey: .pressure)
        self.sea_level = try container.decode(Int.self, forKey: .sea_level)
        self.grnd_level = try container.decode(Int.self, forKey: .grnd_level)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
        self.temp_kf = try container.decode(Float.self, forKey: .temp_kf)
    }
}
