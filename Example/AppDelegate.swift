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
        
        let app = Daiku(component:
            .viewcontroller(UIViewController() )
        ).make()
        
        self.window?.rootViewController = app
        
        return true
    }
}
