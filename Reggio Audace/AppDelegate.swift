//
//  AppDelegate.swift
//  Reggio Audace
//
//  Created by Michele on 27/11/18.
//  Copyright © 2018 LEN Solution. All rights reserved.
//

import UIKit

import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Set window main view
        window?.rootViewController = MainStoryboard.instantiateInitialViewController()
        FirebaseApp.configure()
        // Override point for customization after application launch.
        //return
        let l_Json:[String:Any] = ["prg_channel":1]
        guard let l_Url:URL = URL(string: UrlUtils.URL_GETCHANNEL) else{return true}
        var l_request:URLRequest = URLRequest(url:l_Url)
        l_request.httpMethod = "POST"
        guard let l_JsonData:Data = try? JSONSerialization.data(withJSONObject: l_Json, options: []) else{return true}
        l_request.httpBody = l_JsonData
        let l_DatatTask:URLSessionDataTask = URLSession.shared.dataTask(with: l_request){(data:Data?,response:URLResponse?,error:Error?)in
            if error == nil && data != nil, let l_StringData:String = String(data: data!, encoding: String.Encoding.utf8)
            {
                #if DEBUG
                print("\n\n\n\n\n\(l_StringData)")
                #endif
            }
        }
        l_DatatTask.resume()
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

