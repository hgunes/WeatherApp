//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Harun Gunes on 07/07/2022.
//

import Foundation

//enum WeatherError: String, Error {
//  case badUrl = "🔴 Bad URL"
//}
//
//class NetworkManager {
//  
//  static let shared = NetworkManager()
//  
//  private init() {}
//  
//  func fetchWeater(for city: String, completed: @escaping (Result<Weather?, WeatherError?>) -> Void) {
//    let API_KEY = "b8f33b0d6cd93a819997547f47c529e8"
//    
//    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)")!
//    
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//      if let _ = error {
//        completed(.failure())
//      }
//    }
//    task.resume()
//  }
//}
