//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Harun Gunes on 08/07/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let searchBar = WTextField()
    let searchButton = UIButton(type: .system)
    var cityViewModel: CityViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
}


extension WeatherViewController {
    
    private func style() {
        
        view.backgroundColor = .systemBackground
        
        // SearchBar
        
        
        // SearchButton
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.configuration = .filled()
        searchButton.configuration?.title = "Search"
        searchButton.configuration?.cornerStyle = .large
        searchButton.addTarget(self, action: #selector(getCityData), for: .touchUpInside)
//        searchButton.configuration?.showsActivityIndicator = true
    }
    
    
    private func layout() {
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            searchBar.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchBar.trailingAnchor, multiplier: 1),
            searchBar.heightAnchor.constraint(equalToConstant: 45),
            
            searchButton.topAnchor.constraint(equalToSystemSpacingBelow: searchBar.bottomAnchor, multiplier: 2),
            searchButton.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            searchButton.widthAnchor.constraint(equalTo: searchBar.widthAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.endEditing(true)
        return true
      }
}

// MARK: - Service functions
extension WeatherViewController {
    @objc func getCityData() {
        if let cityName = searchBar.text {
            NetworkManager.shared.fetchWeater(for: cityName) { result in
                switch result {
                case .failure(let error):
                    print(error.rawValue)
                case .success(let cityData):
                    self.cityViewModel = CityViewModel(weatherData: cityData)
                    print(self.cityViewModel.temperature)
                }
            }
        }
        
    }
}
