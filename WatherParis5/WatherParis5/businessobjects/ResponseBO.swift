//
//  ResponseBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation
import RealmSwift

struct ResponseBO {
    let list: [WeatherListItemBO]
    let city: CityBO
}

extension ResponseObject {
    func toBO() -> ResponseBO {
        return ResponseBO(
            list: self.listBO(from: self.list ),
            city: self.city?.toBO() ?? CityBO(id: 0, name: "0", coord: CoordinateBO(lat: 0.0, lon: 0.0), country: "0", population: 0, timezone: 0, sunrise: 0, sunset: 0)
        )
    }
    
    private func listBO(from list: List<WeatherListItemObject>) -> [WeatherListItemBO] {
        var array = [WeatherListItemBO]()
        
        for weather in list {
            array.append(
                weather.toBO()
            )
        }
        
        return array
    }
}
