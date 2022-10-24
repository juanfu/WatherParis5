//
//  CloudsDTO.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation


struct CloudsDTO: Codable {
    let all: Int
    
    enum CodingKeys: String, CodingKey {
        case all
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.all = try container.decode(Int.self, forKey: .all)
    }
}
