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

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

public var entityNameList = [String]()
public var buildingList = [Building]()
public var chosenEntityLocations = [Building]()

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
        HomePage()
    }
}
