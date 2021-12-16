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
     
  }
   
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
     
    // Create Tab one
    let tabOne = AllUsersVC()
    let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(systemName: "heart"), selectedImage: UIImage(named: "selectedImage.png"))
     
    tabOne.tabBarItem = tabOneBarItem
     
     
    // Create Tab two
    let tabTwo = StoreVC()
    let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(systemName: "heart"), selectedImage: UIImage(named: "selectedImage2.png"))
     
    tabTwo.tabBarItem = tabTwoBarItem2
     
    // Create Tab three
    let tabThree = MapsVC()
    let tabTwoBarItem3 = UITabBarItem(title: "Tab 3", image: UIImage(systemName: "heart"), selectedImage: UIImage(named: "selectedImage2.png"))
     
    tabThree.tabBarItem = tabTwoBarItem3
      
      
      // Create Tab four
      let tabFour = ProfileVC()
      let tabTwoBarItem4 = UITabBarItem(title: "Tab 4", image: UIImage(systemName: "heart"), selectedImage: UIImage(named: "selectedImage2.png"))
       
      tabThree.tabBarItem = tabTwoBarItem4
     
     
    self.viewControllers = [tabOne, tabTwo, tabThree , tabFour]
  }
   
  // UITabBarControllerDelegate method
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected \(viewController.title)")
  }
    
}
