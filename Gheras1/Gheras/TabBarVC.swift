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
      tabBar.tintColor = .green
     
  }
   
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
     
    // Create Tab one
    let tabOne = AllUsersVC()
    let tabOneBarItem = UITabBarItem(title: "مجتمع غراس", image: UIImage(systemName: "person.3.fill"), selectedImage: UIImage(named: "selectedImage.png"))
    tabOne.tabBarItem = tabOneBarItem
     
//      tabBarItem.badgeColor = .green
     
    // Create Tab two
    let tabTwo = StoreVC()
    let tabTwoBarItem2 = UITabBarItem(title: "المتجر", image: UIImage(systemName: "heart"), selectedImage: UIImage(named: "selectedImage2.png"))
     
    tabTwo.tabBarItem = tabTwoBarItem2
     
    // Create Tab three
    let tabThree = MapsVC()
    let tabTwoBarItem3 = UITabBarItem(title: "الخريطة", image: UIImage(systemName: "map"), selectedImage: UIImage(named: "selectedImage2.png"))
     
    tabThree.tabBarItem = tabTwoBarItem3
      
      
      // Create Tab four
      let tabFour = ProfileVC()
      let tabTwoBarItem4 = UITabBarItem(title: "ملفي الشخصي", image: UIImage(systemName: "person.fill"), selectedImage: UIImage(named: "selectedImage2.png"))
       
      tabFour.tabBarItem = tabTwoBarItem4
     
     
    self.viewControllers = [tabOne, tabTwo, tabThree , tabFour]
  }
   
  // UITabBarControllerDelegate method
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected \(viewController.title)")
  }
    
}
