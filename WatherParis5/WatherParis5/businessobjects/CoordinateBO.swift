//
//  CoordinateBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct CoordinateBO {
    let lat: Float
    let lon: Float
}

extension CoordinateObject {
    func toBO() -> CoordinateBO {
        return CoordinateBO(lat: self.lat, lon: self.lon)
    }
}
