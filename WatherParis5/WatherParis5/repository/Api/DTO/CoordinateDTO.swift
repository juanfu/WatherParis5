//
//  CoordinateDTO.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation

struct CoordinateDTO: Codable {
    let lat: Float
    let lon: Float
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decode(Float.self, forKey: .lat)
        self.lon = try container.decode(Float.self, forKey: .lon)
    }
}
