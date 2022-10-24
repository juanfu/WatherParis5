//
//  WindDTO.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation

struct WindDTO: Codable {
    let speed: Float
    let deg: Int
    let gust: Float
    
    enum CodingKeys: String, CodingKey {
        case speed
        case deg
        case gust
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decode(Float.self, forKey: .speed)
        self.deg = try container.decode(Int.self, forKey: .deg)
        self.gust = try container.decode(Float.self, forKey: .gust)
    }
}
