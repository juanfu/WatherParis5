//
//  WeatherListItem.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation


struct WeatherListItemDTO: Codable {
    let dt: Int
    let main: MainDTO
    let weather: [WeatherDTO]
    let clouds: CloudsDTO
    let wind: WindDTO
    let visibility: Int
    let pop: Int
    let sys: SysDTO
    let dt_txt: String
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case sys
        case dt_txt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dt = try container.decode(Int.self, forKey: .dt)
        self.main = try container.decode(MainDTO.self, forKey: .main)
        self.weather = try container.decode([WeatherDTO].self, forKey: .weather)
        self.clouds = try container.decode(CloudsDTO.self, forKey: .clouds)
        self.wind = try container.decode(WindDTO.self, forKey: .wind)
        self.visibility = try container.decode(Int.self, forKey: .visibility)
        self.pop = try container.decode(Int.self, forKey: .pop)
        self.sys = try container.decode(SysDTO.self, forKey: .sys)
        self.dt_txt = try container.decode(String.self, forKey: .dt_txt)
    }
}
