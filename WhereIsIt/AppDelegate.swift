//
//  AppDelegate.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/9/21.
//

import UIKit
import Firebase

//public var entityNameList = [String]()


class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for customization after application launch
        FirebaseApp.configure()
        return true
    }
}
