//
//  WeatherError.swift
//  WeatherApp
//
//  Created by Harun Gunes on 09/07/2022.
//

import Foundation

enum WeatherError: String, Error {
  case badUrl = "🔴 Bad URL"
  case unableToComplete = "🔴 Unable to complete the request."
  case invalidResponse = "🔴 Invalid response from the server."
  case invalidData = "🔴 Invalid data"
}
