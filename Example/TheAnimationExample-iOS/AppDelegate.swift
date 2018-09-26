//
//  AppDelegate.swift
//  TheAnimationExample
//
//  Created by marty-suzuki on 2018/05/12.
//  Copyright © 2018年 marty-suzuki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    #if swift(>=4.2)
    typealias LaunchOptionsKey = UIApplication.LaunchOptionsKey
    #else
    typealias LaunchOptionsKey = UIApplicationLaunchOptionsKey
    #endif
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
}

