//
//  Weather.swift
//  WeatherApp
//
//  Created by Harun Gunes on 08/07/2022.
//

import Foundation

struct WeatherData: Codable {
  let weather: [Weather]
  let main: Main
}

struct Weather: Codable {
  let id: Int
  let main: String
}

struct Main: Codable {
  let temp: Double
  let feelsLike: Double
  let humidity: Int
}
