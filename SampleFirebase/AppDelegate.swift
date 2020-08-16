//
//  AppDelegate.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/08/03.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    FirebaseUtil.setup()
    let _ = ConfigUtil.shared
    return true
  }
}

