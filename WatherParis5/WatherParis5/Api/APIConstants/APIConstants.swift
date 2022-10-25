//
//  APIConstants.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation

struct APIConstants {
    static let api_key = "c8e6d24149b8223522e288d64afb86bc"
    static let base_url = "https://api.openweathermap.org/data/2.5/forecast"
    
    static let params: [String : String] = [
        "lat" : "38.2303",
        "lon" : "-0.8151",
        "appid" : APIConstants.api_key,
        "units" : "metric"
    ]
}
