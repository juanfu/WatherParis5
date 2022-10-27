//
//  DBModels.swift
//  WatherParis5
//
//  Created by juanfu on 25/10/22.
//

import Foundation
import RealmSwift


final class ResponseObject: Object {
    @Persisted var cod: String
    @Persisted var message: Int
    @Persisted var cnt: Int
    @Persisted var list: List<WeatherListItemObject>
    @Persisted var city: CityObject?
    
    public init(cod: String, message: Int, cnt: Int, list: List<WeatherListItemObject>, city: CityObject) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
    
    public override init() {
        super.init()
    }
}

final class WeatherListItemObject: Object {
    @Persisted var dt: Int
    @Persisted var main: MainObject?
    @Persisted var weather: List<WeatherObject>
    @Persisted var clouds: CLoudsObject?
    @Persisted var wind: WindObject?
    @Persisted var visibility: Int
    @Persisted var pop: Int
    @Persisted var sys: SysObject?
    @Persisted var dt_text: String
    
    public init(dt: Int, main: MainObject, weather: List<WeatherObject>, clouds: CLoudsObject, wind: WindObject, visibility: Int, pop: Int, sys: SysObject, dt_text: String) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.visibility = visibility
        self.pop = pop
        self.sys = sys
        self.dt_text = dt_text
    }
    
    override init() {
        super.init()
        self.dt = 0
        self.main = MainObject()
        self.weather = List<WeatherObject>()
        self.clouds = CLoudsObject()
        self.wind = WindObject()
        self.visibility = 0
        self.pop = 0
        self.sys = SysObject()
        self.dt_text = "0"
    }
}

final class MainObject: Object {
    @Persisted var temp: Float
    @Persisted var feels_like: Float
    @Persisted var temp_min: Float
    @Persisted var temp_max: Float
    @Persisted var pressure: Int
    @Persisted var sea_level: Int
    @Persisted var grnd_level: Int
    @Persisted var humidity: Int
    @Persisted var temp_kf: Float
    
    public init(temp: Float, feels_like: Float, temp_min: Float, temp_max: Float, pressure: Int, sea_level: Int, grnd_level: Int, humidity: Int, temp_kf: Float) {
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.pressure = pressure
        self.sea_level = sea_level
        self.grnd_level = grnd_level
        self.humidity = humidity
        self.temp_kf = temp_kf
    }
    
    override public init() {
        super.init()
        self.temp = 0.0
        self.feels_like = 0.0
        self.temp_min = 0.0
        self.temp_max = 0.0
        self.pressure = 0
        self.sea_level = 0
        self.grnd_level = 0
        self.humidity = 0
        self.temp_kf = 0.0
    }
}

final class WeatherObject: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var main: String
    @Persisted var desc: String
    @Persisted var icon: String
    
    public init(id: Int, main: String, desc: String, icon: String) {
        super.init()
        self.id = id
        self.main = main
        self.desc = desc
        self.icon = icon
    }
    
    override public init() {
        super.init()
        self.id = 0
        self.main = "0"
        self.desc = "0"
        self.icon = "0"
    }
}

final class CLoudsObject: Object {
    @Persisted var all: Int
    
    public init(all: Int) {
        self.all = all
    }
    
    override public init(){
        super.init()
        self.all = 0
    }
}

final class WindObject: Object {
    @Persisted var speed: Float
    @Persisted var deg: Int
    @Persisted var gust: Float
    
    public init(speed: Float, deg: Int, gust: Float) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
    
    override public init() {
        super.init()
        self.speed = 0.0
        self.deg = 0
        self.gust = 0.0
    }
}

final class SysObject: Object {
    @Persisted var pod: String
    
    public init(pod: String) {
        self.pod = pod
    }
    
    override public init() {
        super.init()
        self.pod = "0"
    }
}

final class CityObject: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var coord: CoordinateObject?
    @Persisted var country: String
    @Persisted var population: Int
    @Persisted var timezone: Int
    @Persisted var sunrise: Int
    @Persisted var sunset: Int
    
    public init(id: Int, name: String, coord: CoordinateObject, country: String, population: Int, timezone: Int, sunrise: Int, sunset: Int) {
        super.init()
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
    override public init() {
        super.init()
        self.id = 0
        self.name = "0"
        self.coord = CoordinateObject()
        self.country = "0"
        self.population = 0
        self.timezone = 0
        self.sunrise = 0
        self.sunset = 0
    }
}

final class CoordinateObject: Object {
    @Persisted var lat: Float
    @Persisted var lon: Float
    
    public init(lat: Float, lon: Float) {
        self.lat = lat
        self.lon = lon
    }
    
    override public init() {
        super.init()
        self.lat = 0
        self.lon = 0
    }
}
