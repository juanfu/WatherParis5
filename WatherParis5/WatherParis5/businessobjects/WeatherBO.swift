//
//  WeatherBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct WeatherBO {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


extension WeatherObject {
    func toBO() -> WeatherBO {
        return WeatherBO(
            id: self.id,
            main: self.main,
            description: self.description,
            icon: self.icon
        )
    }
}
