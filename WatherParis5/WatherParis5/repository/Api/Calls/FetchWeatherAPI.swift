//
//  FetchWeatherAPI.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation
import Alamofire

class FetchWeatherAPI {
    func fetchWeather(completion: @escaping (Error?) -> Void) {
        AF.request(APIConstants.base_url, parameters: APIConstants.params, encoder: URLEncodedFormParameterEncoder.default)
            .responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                
                let items : ResponseDTO = try! decoder.decode(ResponseDTO.self, from: data)
                
                // Guardar datos en DB
                let realmObject = DBMappers.dbMapper(from: items)
                DatabaseManager.shared.persistInDatabase(model: realmObject) { error in
                    completion(error)
                }
                
            case let .failure(error):
                completion(error)
            }
        }
    }
}
