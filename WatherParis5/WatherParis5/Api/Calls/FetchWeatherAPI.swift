//
//  FetchWeatherAPI.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation
import Alamofire

class FetchWeatherAPI {
    
    func fetchWeather() {
        AF.request(APIConstants.base_url, parameters: APIConstants.params).responseData { response in
            switch response.result {
            case .success(let data):
                print(data)
            case let .failure(error):
                print(error)
            }
        }
    }
}
