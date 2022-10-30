//
//  WeatherListItemBO.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation
import RealmSwift


struct WeatherListItemBO {
    let dt: Int
    let main: MainBO
    let weather: [WeatherBO]
    let clouds: CloudsBO
    let wind: WindBO
    let visibility: Int
    let pop: Int
    let sys: SysBO
    let dt_txt: String
    let dt_txt_hour: String
    let dt_date: String
}

extension WeatherListItemBO : Hashable {
    static func == (lhs: WeatherListItemBO, rhs: WeatherListItemBO) -> Bool {
        return lhs.dt == rhs.dt
    }
    
    func hash(into hasher: inout Hasher) {
          hasher.combine(dt)
      }
}

extension WeatherListItemObject {
    func toBO() -> WeatherListItemBO {
        let splitted_dt_txt = self.dt_text.split(separator: " ")
        var txt_hour = "No Hour Found"
        var txt_date = "No Date Found"
        var date: Date? = nil
        if splitted_dt_txt.count == 2 {
            txt_hour = String(splitted_dt_txt[1])
            txt_date = String(splitted_dt_txt[0])
        }
        
        if txt_date != "No Date Found" {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy-MM-dd"
            date = dateFormatter.date(from: txt_date)

            let dtFormatter = DateFormatter()
            dtFormatter.dateStyle = .long
            dtFormatter.timeStyle = .none

            txt_date = dtFormatter.string(from: date ?? Date())
        }
        return WeatherListItemBO(
            dt: self.dt,
            main: self.main?.toBO() ?? MainBO(temp: 0.0, feels_like: 0.0, temp_min: 0.0, temp_max: 0.0, pressure: 0, sea_level: 0, grnd_level: 0, humidity: 0, temp_kf: 0.0),
            weather: self.weatherListBO(from: self.weather),
            clouds: self.clouds?.toBO() ?? CloudsBO(all: 0),
            wind: self.wind?.toBO() ?? WindBO(speed: 0.0, deg: 0, gust: 0.0),
            visibility: self.visibility,
            pop: self.pop,
            sys: self.sys?.toBO() ?? SysBO(pod: "0"),
            dt_txt: self.dt_text,
            dt_txt_hour: txt_hour,
            dt_date: txt_date
        )
    }
    
    private func weatherListBO(from list: List<WeatherObject>) -> [WeatherBO] {
        var array = [WeatherBO]()
        
        for weather in list {
            array.append(
                WeatherBO(
                    id: weather.id,
                    main: weather.main,
                    description: weather.desc,
                    icon: weather.icon
                )
            )
        }
        
        return array
    }
}
