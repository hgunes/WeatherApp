//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Harun Gunes on 07/07/2022.
//

import Foundation

class NetworkManager {
  
  static let shared = NetworkManager()
  
  private init() {}
  
  func fetchWeater(for city: String, completed: @escaping (Result<WeatherData, WeatherError>) -> Void) {
    let API_KEY = "b8f33b0d6cd93a819997547f47c529e8"
    
    let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=metric"
    
    guard let url = URL(string: url) else {
      completed(.failure(.badUrl))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let _ = error {
        completed(.failure(.unableToComplete))
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        completed(.failure(.invalidData))
        return
      }
      
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let result = try decoder.decode(WeatherData.self, from: data)
        
        completed(.success(result))
      } catch {
        completed(.failure(.invalidData))
      }
    }
    task.resume()
  }
}
