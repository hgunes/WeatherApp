//
//  CurrentDegreeLabel.swift
//  WeatherApp
//
//  Created by Harun Gunes on 11/07/2022.
//

import UIKit

class CurrentDegreeLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    font = UIFont.boldSystemFont(ofSize: 65)
    textColor = .label
    textAlignment = .center
  }
}
