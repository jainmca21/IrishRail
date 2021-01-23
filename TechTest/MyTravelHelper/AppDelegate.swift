//
//  AppDelegate.swift
//  MyTravelHelper
//
//  Created by Satish on 11/03/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigation: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //let notice = SearchTrainRouter.createModule()
        let notice = FavStationRouter.createModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        navigation = UINavigationController(rootViewController: notice)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return false
    }
}

