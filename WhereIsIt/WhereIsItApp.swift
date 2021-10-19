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

public var entityNameList = [String]()

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

struct WhereIsItApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
