//
//  AppDelegate.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController.init(rootViewController: ViewController.init())
        window?.makeKeyAndVisible()
//        self.window?.layer.speed = 0.1;
        return true
    }


}

