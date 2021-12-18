//
//  ViewController5.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit


class TabBarVC: UITabBarController, UITabBarControllerDelegate{
   
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
      
      tabBar.backgroundColor = .white
      tabBar.tintColor = #colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1)
     
  }
   
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
     
    // Create Tab one
    let tabOne = AllUsersVC()
    let tabOneBarItem = UITabBarItem(title: "مجتمع غراس", image: UIImage(systemName: "person.3"), selectedImage: UIImage(named: "selectedImage.png"))
    tabOne.tabBarItem = tabOneBarItem
     
     
    // Create Tab two
    let tabTwo = StoreVC()
    let tabTwoBarItem2 = UITabBarItem(title: "المتجر", image: UIImage(systemName: "bag"), selectedImage: UIImage(named: "selectedImage2.png"))
     
    tabTwo.tabBarItem = tabTwoBarItem2
     
    // Create Tab three
    let tabThree = MapsVC()
    let tabTwoBarItem3 = UITabBarItem(title: "الخريطة", image: UIImage(systemName: "map"), selectedImage: UIImage(named: "selectedImage2.png"))
     
    tabThree.tabBarItem = tabTwoBarItem3
      
      
      // Create Tab four
      let tabFour = ProfileVC()
      let tabTwoBarItem4 = UITabBarItem(title: "ملفي الشخصي", image: UIImage(systemName: "person"), selectedImage: UIImage(named: "selectedImage2.png"))
       
      tabFour.tabBarItem = tabTwoBarItem4
     
     
    self.viewControllers = [tabFour, tabTwo, tabThree , tabOne]
  }
   
  // UITabBarControllerDelegate method
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected \(viewController.title)")
  }
    
}
