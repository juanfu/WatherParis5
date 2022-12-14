//
//  HomeViewModel.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var model: HomeModel?
    let repository: WeatherInfoRepositoryProtocol
    
    public init(model: HomeModel? = nil, repository: WeatherInfoRepositoryProtocol = WeatherInfoRepository()) {
        self.model = model
        self.repository = repository
    }
    
    public func fetchWeatherData() {
        repository.fetchWeather { responseBO in
            DispatchQueue.main.async {
                self.model = HomeModel(model: responseBO)
            }
        }
    }
}
