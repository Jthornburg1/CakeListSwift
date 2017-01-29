//
//  AppDelegate.swift
//  WaracleTest
//
//  Created by jonathan thornburg on 1/24/17.
//  Copyright © 2017 jonathan thornburg. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        CakeController.module.getCakesWithUrlString(urlString: Constants.resourceString) { (cakes, error) in
            
        }
        return true
    }

    
}

