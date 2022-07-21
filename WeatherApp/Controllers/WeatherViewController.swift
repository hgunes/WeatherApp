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
    let currentDegree = CurrentDegreeLabel()
    
    var cityViewModel: CityViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        setGradientBackground()
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
        
        // StackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        
        // CurrentDegree
        currentDegree.font = UIFont.boldSystemFont(ofSize: 65)
        currentDegree.textColor = .systemBlue
    }
    
    
    private func layout() {
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(searchButton)
        view.addSubview(stackView)
        view.addSubview(currentDegree)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            
            currentDegree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentDegree.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
        searchButton.configuration?.showsActivityIndicator = true
        
        if let cityName = searchBar.text {
            NetworkManager.shared.fetchWeater(for: cityName) { result in
                switch result {
                case .failure(let error):
                    print(error.rawValue)
                case .success(let cityData):
                    self.cityViewModel = CityViewModel(weatherData: cityData)
                    DispatchQueue.main.async {
                        self.currentDegree.text = "\(self.cityViewModel.temperature)"
                        self.searchButton.configuration?.showsActivityIndicator = false
                    }
                    
                }
            }
        }
        
    }
}

extension WeatherViewController {
    private func setGradientBackground() {
        let colorTop =  UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 110.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 146.0/255.0, green: 220.0/255.0, blue: 126.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
