//
//  CityViewModelTests.swift
//  WeatherAppTests
//
//  Created by Harun Gunes on 20/07/2022.
//

import XCTest
@testable import WeatherApp

class CityViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCityViewModel() throws {
        
        let weatherData = WeatherData(weather: [Weather(id: 1, main: "test main")], main: Main(temp: 29.37, feelsLike: 26.23, humidity: 47), name: "Erzurum")

        
        let cityViewModel = CityViewModel(weatherData: weatherData)
        
        XCTAssertEqual(weatherData.name, cityViewModel.city)
        XCTAssertEqual(weatherData.main.temp, cityViewModel.temperature)
    }
}
