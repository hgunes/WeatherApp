//
//  TabbarController.swift
//  WeatherApp
//
//  Created by Harun Gunes on 07/07/2022.
//

import UIKit

class TabbarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewControllers()
    configureTabbar()
  }
  
  
  private func setupViewControllers() {
    let weatherVC = WeatherViewController()
    let favoritesVC = FavoritesViewController()
    
    weatherVC.setTabBarImage(imageName: "humidity.fill", title: "Weather")
    favoritesVC.setTabBarImage(imageName: "star.fill", title: "Favorites")
    
    let weatherNavigation = UINavigationController(rootViewController: weatherVC)
    let favoritesNavigation = UINavigationController(rootViewController: favoritesVC)
    
    let tabbarList = [weatherNavigation, favoritesNavigation]
    
    viewControllers = tabbarList
  }
  
  
  private func configureTabbar() {
    UITabBar.appearance().tintColor = .black
    UITabBar.appearance().backgroundColor = .white
  }
  
}

extension UIViewController {
  
  func setTabBarImage(imageName: String, title: String) {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: imageName, withConfiguration: configuration)
    
    tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    tabBarController?.tabBar.backgroundColor = .white
  }
}

