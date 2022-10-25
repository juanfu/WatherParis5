//
//  ResponseDTO.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation

struct ResponseDTO: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [WeatherListItemDTO]
    let city: CityDTO
    
    enum CodingKeys: String, CodingKey {
        case cod
        case message
        case cnt
        case list
        case city
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cod = try container.decode(String.self, forKey: .cod)
        self.message = try container.decode(Int.self, forKey: .message)
        self.cnt = try container.decode(Int.self, forKey: .cnt)
        self.list = try container.decode([WeatherListItemDTO].self, forKey: .list)
        self.city = try container.decode(CityDTO.self, forKey: .city)
    }
}
