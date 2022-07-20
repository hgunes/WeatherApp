//
//  WeatherServiceTest.swift
//  WeatherAppTests
//
//  Created by Harun Gunes on 09/07/2022.
//

import XCTest
@testable import WeatherApp

class WeatherServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testCanParse() {
        let json = """
        {
        "coord": {
        "lon": 19.4667,
        "lat": 51.75
        },
        "weather": [
        {
        "id": 803,
        "main": "Clouds",
        "description": "broken clouds",
        "icon": "04d"
        }
        ],
        "base": "stations",
        "main": {
        "temp": 19.48,
        "feels_like": 18.95,
        "temp_min": 18.9,
        "temp_max": 20.09,
        "pressure": 1018,
        "humidity": 56
        },
        "visibility": 10000,
        "wind": {
        "speed": 6.69,
        "deg": 280
        },
        "clouds": {
        "all": 75
        },
        "dt": 1657370170,
        "sys": {
        "type": 2,
        "id": 19430,
        "country": "PL",
        "sunrise": 1657334062,
        "sunset": 1657393192
        },
        "timezone": 7200,
        "id": 3093133,
        "name": "Łódź",
        "cod": 200
        }
        """
        
        let data = json.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let result = try? decoder.decode(WeatherData.self, from: data)
        
        XCTAssertEqual(result?.name, "Łódź")
        XCTAssertEqual(result?.main.temp, 19.48)
        XCTAssertEqual(result?.main.feelsLike, 18.95)
        XCTAssertEqual(result?.main.humidity, 56)
    }
}
