//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Harun Gunes on 08/07/2022.
//

import UIKit

class WeatherViewController: UIViewController {
  
  private let searchBar: UITextField = {
    let searchBar = UITextField(frame: .zero)
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    configureSearchbar()
  }
  
  
  private func configure() {
    setGradientBackground()
    
//    view.backgroundColor = .systemPink
    
    view.addSubview(searchBar)
    
    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      searchBar.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
      searchBar.heightAnchor.constraint(equalToConstant: 45)
    ])
  }
  
  
  func configureSearchbar() {
    
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    
    searchBar.layer.cornerRadius = 15
    //    searchBar.layer.borderWidth = 2
    //    searchBar.layer.borderColor = UIColor.systemGray4.cgColor
    
    searchBar.textColor = .label
    searchBar.tintColor = .label
    
    searchBar.font = UIFont.preferredFont(forTextStyle: .title2)
    searchBar.adjustsFontSizeToFitWidth = true
    searchBar.minimumFontSize = 12
    
    searchBar.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
    //    1.0, 0.18, 0.33, 1.0
    searchBar.autocorrectionType = .yes
    searchBar.returnKeyType = .go
    searchBar.placeholder = " 🔍 Search"
    searchBar.clearButtonMode = .whileEditing
  }
  
  
  private func setGradientBackground() {
    let colorTop =  UIColor(red: 167/255.0, green: 132/255.0, blue: 239/255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 75/255.0, green: 0/255.0, blue: 130/255.0, alpha: 1.0).cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = self.view.bounds
    
    self.view.layer.insertSublayer(gradientLayer, at:0)
  }
  
}

extension WeatherViewController: UITextFieldDelegate {
  
}

