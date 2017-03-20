//
//  AppDelegate.swift
//  Example
//
//  Created by Matthew Faluotico on 3/18/17.
//  Copyright © 2017 mattfaluotico. All rights reserved.
//

import UIKit
import Daiku

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        let random = Int(arc4random_uniform(3))
        
        let code: String = {
            switch random {
            case 0: return "one"
            case 1: return "two"
            default: return "beta"
            }
        }()
        
        window.rootViewController = myAppStructure[code].make()
        
        self.window = window
                
        return true
    }
}
