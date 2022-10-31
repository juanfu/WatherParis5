//
//  WatherParis5Tests.swift
//  WatherParis5Tests
//
//  Created by juanfu on 22/10/22.
//

import XCTest
import Mockingbird
@testable import WatherParis5

final class WatherParis5Tests: XCTestCase {
    var database: DatabaseManagerMock!
    var api: FetchWeatherAPIMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        database = mock(DatabaseManager.self)
        api = mock(FetchWeatherAPI.self)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        reset(database)
        reset(api)
    }

    func testRepositoryCall() throws {
        given(database.getData()).willReturn(nil)
        given(api.fetchWeather(completion: any()))
        WeatherInfoRepository(database: database, api: api).fetchWeather { response in
            response != nil
        }
        verify(database.getData()).wasCalled(1)
        verify(api.fetchWeather(completion: any())).wasCalled(1)
    }

}
