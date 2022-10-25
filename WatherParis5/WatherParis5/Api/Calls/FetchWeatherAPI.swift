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
        AF.request(APIConstants.base_url, parameters: APIConstants.params, encoder: URLEncodedFormParameterEncoder.default)
            .responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
               // decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let items : ResponseDTO = try! decoder.decode(ResponseDTO.self, from: data)
                print(items.list.count)
            case let .failure(error):
                print(error)
            }
        }
    }
}
