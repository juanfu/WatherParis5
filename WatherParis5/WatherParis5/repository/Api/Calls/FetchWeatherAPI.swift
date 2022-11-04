//
//  FetchWeatherAPI.swift
//  WatherParis5
//
//  Created by juanfu on 23/10/22.
//

import Foundation
import Alamofire

class FetchWeatherAPI {
    func fetchWeather(completion: @escaping (Errors?) -> Void) {
        AF.request(APIConstants.base_url, parameters: APIConstants.params, encoder: URLEncodedFormParameterEncoder.default)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    
                    // Camviar try! por try y usar do catch
                    var items: ResponseDTO
                    do {
                        items = try decoder.decode(ResponseDTO.self, from: data)
                        // Guardar datos en DB
                        let realmObject = DBMappers.dbMapper(from: items)
                        DatabaseManager.shared.persistInDatabase(model: realmObject) { error in
                            completion(Errors.databasePersist)
                        }
                    } catch {
                        completion(Errors.decoder)
                    }
                    
                case .failure(_):
                    completion(Errors.requestError)
                }
            }
    }
}
