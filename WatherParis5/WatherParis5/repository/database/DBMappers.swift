//
//  DBMappers.swift
//  WatherParis5
//
//  Created by juanfu on 25/10/22.
//

import Foundation
import RealmSwift

final class DBMappers {
    static func dbMapper(from dto: ResponseDTO) -> ResponseObject {
        return ResponseObject(
            cod: dto.cod,
            message: dto.message,
            cnt: dto.cnt,
            list: DBMappers.dbMapperListWeather(from: dto.list),
            city: DBMappers.dbMapperCity(from: dto.city)
        )
    }
    
    static func dbMapperCity(from dto: CityDTO) -> CityObject {
       return  CityObject(
            id: dto.id,
            name: dto.name,
            coord: DBMappers.dbMapperCoordinate(from: dto.coord),
            country: dto.country,
            population: dto.population,
            timezone: dto.timezone,
            sunrise: dto.sunrise,
            sunset: dto.sunset
        )
    }
    
    static func dbMapperCoordinate(from dto: CoordinateDTO) -> CoordinateObject {
       return CoordinateObject(lat: dto.lat, lon: dto.lon)
    }
    
    static func dbMapperListWeather(from dto: [WeatherListItemDTO]) -> List<WeatherListItemObject> {
        let list = List<WeatherListItemObject>()
        dto.forEach { weatherItem in
            list.append(
                WeatherListItemObject(
                    dt: weatherItem.dt,
                    main: DBMappers.dbMapperMain(from: weatherItem.main),
                    weather: DBMappers.dbMapperWeather(from: weatherItem.weather),
                    clouds: DBMappers.dbMapperClouds(from: weatherItem.clouds),
                    wind: DBMappers.dbMapperWind(from: weatherItem.wind),
                    visibility: weatherItem.visibility,
                    pop: weatherItem.pop ?? 0,
                    sys: DBMappers.dbMapperSys(from: weatherItem.sys),
                    dt_text: weatherItem.dt_txt
                )
            )
        }
        return list
    }
    
    static func dbMapperWeather(from dto: [WeatherDTO]) -> List<WeatherObject> {
        let list = List<WeatherObject>()
        
        dto.forEach { weather in
            list.append(
                WeatherObject(
                    id: weather.id,
                    main: weather.main,
                    desc: weather.description,
                    icon: weather.icon
                )
            )
        }
        
        return list
    }
    
    static func dbMapperSys(from dto: SysDTO) -> SysObject {
        return SysObject(pod: dto.pod)
    }
    
    static func dbMapperWind(from dto: WindDTO) -> WindObject {
        return WindObject(
            speed: dto.speed,
            deg: dto.deg,
            gust: dto.gust
        )
    }
    
    static func dbMapperClouds(from dto: CloudsDTO) -> CLoudsObject {
        return CLoudsObject(all: dto.all)
    }
    
    static func dbMapperMain(from dto: MainDTO) -> MainObject {
        return MainObject(
            temp: dto.temp,
            feels_like: dto.feels_like,
            temp_min: dto.temp_min,
            temp_max: dto.temp_max,
            pressure: dto.pressure,
            sea_level: dto.sea_level,
            grnd_level: dto.grnd_level,
            humidity: dto.humidity,
            temp_kf: dto.temp_kf
        )
    }
}
