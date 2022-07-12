//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Harun Gunes on 08/07/2022.
//

import UIKit

class WeatherViewController: UIViewController {
  
  let searchBar = WTextField()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }
  
}


extension WeatherViewController {
  
  private func style() {
    
    view.backgroundColor = .systemBackground
    
  }
  
  
  private func layout() {
    view.addSubview(searchBar)
    
    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      searchBar.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchBar.trailingAnchor, multiplier: 1),
      searchBar.heightAnchor.constraint(equalToConstant: 45)
    ])
  }
}

// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
  
}


