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
    let stackView = UIStackView()
    
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
        searchBar.font = UIFont.systemFont(ofSize: 24)
        searchBar.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // SearchButton
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.configuration = .filled()
        searchButton.configuration?.title = "Search"
        searchButton.configuration?.cornerStyle = .large
        searchButton.addTarget(self, action: #selector(getCityData), for: .touchUpInside)
//        searchButton.configuration?.showsActivityIndicator = true
        
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
    }
    
    
    private func layout() {
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(searchButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
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
