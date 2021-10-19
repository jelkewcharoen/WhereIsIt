//
//  AppDelegate.swift
//  WhereIsIt
//
//  Created by Andrew Lukman on 10/9/21.
//

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for customization after application launch
        FirebaseApp.configure()
        Firestore.firestore().collection("List").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else if entityNameList.isEmpty {
                var i = 0
                for document in querySnapshot!.documents {
                    entityNameList.append(document.documentID)
                    i+=1
                }
            }
        }
        return true
    }
}
