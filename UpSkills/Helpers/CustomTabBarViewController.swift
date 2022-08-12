//
//  CustomTabBarViewController.swift
//  UpSkills
//
//  Created by Alfin on 11/8/22.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.tabBar.tintColor = UIColor(named: "TabBarTint")!
      self.tabBar.layer.cornerRadius = 30
      self.tabBar.layer.masksToBounds = true
      // making sure that corner radius is masked only for the top two corner not the remaning corners
      self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
      self.tabBar.selectionIndicatorImage = UIImage(named: "Selected")
      self.additionalSafeAreaInsets.bottom = 20
      
    }

}
