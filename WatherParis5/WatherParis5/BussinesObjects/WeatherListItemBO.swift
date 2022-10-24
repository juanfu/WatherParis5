//
//  WeatherListItemBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation


struct WeatherListItemBO {
    let dt: Int
    let main: MainBO
    let weather: WeatherBO
    let clouds: CloudsBO
    let wind: WindBO
    let visibility: Int
    let pop: Int
    let sys: SysBO
    let dt_txt: String
    
}
