//
//  WindBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct WindBO {
    let speed: Float
    let deg: Int
    let gust: Float
}

extension WindObject {
    func toBO() -> WindBO {
        return WindBO(
            speed: self.speed,
            deg: self.deg,
            gust: self.gust
        )
    }
}
