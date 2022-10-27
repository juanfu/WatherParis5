//
//  SysDTO.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation

struct SysDTO: Codable {
    let pod: String
    
    enum CodingKeys: String, CodingKey {
        case pod
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pod = try container.decode(String.self, forKey: .pod)
    }
}
