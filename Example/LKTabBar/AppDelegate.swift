//
//  AppDelegate.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit
import LKTabBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        self.window = UIWindow(frame:UIScreen.main.bounds)
//        self.window?.makeKeyAndVisible()
//
//        
//        let vc1 = DemoViewController()
//        let vc2 = DemoViewController()
//        let vc3 = DemoViewController()
//        let vc4 = DemoViewController()
//        let vc5 = DemoViewController()
//
//        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
//        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
//        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
//        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
//        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
//        
//        let config =  LKTabBarConfig()
//        let tabBarController = LKTabBarController(config: config)
//        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
//        
//        self.window?.rootViewController = tabBarController
        
       
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

