//
//  AppDelegate.swift
//  SiriSample
//
//  Created by coco j on 2019/02/22.
//  Copyright © 2019 amaocha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == String(describing: DoSomethingIntent.self) {
            guard let intent = userActivity.interaction?.intent as? DoSomethingIntent,
                let taskName = intent.taskName,
                let window = self.window,
                let vc = window.rootViewController as? ViewController else {
                    return false
            }
            
            vc.label.text = taskName
            print("handleされた")
            return true
        }
        return false
    }


}

