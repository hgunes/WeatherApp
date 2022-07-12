//
//  WTextField.swift
//  WeatherApp
//
//  Created by Harun Gunes on 11/07/2022.
//

import UIKit

class WTextField: UITextField {
  
  var textPadding = UIEdgeInsets(
    top: 0,
    left: 20,
    bottom: 0,
    right: 0
  )
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
    
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    
    layer.cornerRadius = 15
    textColor = .label
    tintColor = .label
    
    font = UIFont.preferredFont(forTextStyle: .title2)
    backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
    
    autocorrectionType = .yes
    returnKeyType = .go
    placeholder = "🔍 Search"
    clearButtonMode = .whileEditing
    
  }
}
