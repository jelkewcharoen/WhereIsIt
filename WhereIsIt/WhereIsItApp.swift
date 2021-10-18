//
//  WhereIsItApp.swift
//  WhereIsIt
//
//  Created by Green T
//

import SwiftUI
import UIKit
import Firebase
import FirebaseFirestore

//var entityNameList = ["bathroom", "microwave", "printer"]; // temporary array to store entities in main search


@main
struct WhereIsItApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        WindowGroup {
            HomePage()
                .preferredColorScheme(.none)
        }
    }
}
