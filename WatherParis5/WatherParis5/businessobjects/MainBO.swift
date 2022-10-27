//
//  MainBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct MainBO {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Int
    let sea_level: Int
    let grnd_level: Int
    let humidity: Int
    let temp_kf: Float
}


extension MainObject {
    func toBO() -> MainBO {
        return MainBO(
            temp: self.temp,
            feels_like: self.feels_like,
            temp_min: self.temp_min,
            temp_max: self.temp_max,
            pressure: self.pressure,
            sea_level: self.sea_level,
            grnd_level: self.grnd_level,
            humidity: self.humidity,
            temp_kf: self.temp_kf
        )
    }
}
