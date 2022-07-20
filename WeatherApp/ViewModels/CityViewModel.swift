//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Harun Gunes on 20/07/2022.
//

import Foundation

struct CityViewModel {
    
    let city: String
    let temperature: Double
    
    init(weatherData: WeatherData) {
        self.city = weatherData.name
        self.temperature = weatherData.main.temp
    }
}
