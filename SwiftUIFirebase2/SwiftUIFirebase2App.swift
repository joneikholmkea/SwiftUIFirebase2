//
//  SwiftUIFirebase2App.swift
//  SwiftUIFirebase2
//
//  Created by Jon Eikholm on 15/03/2023.
//

//import SwiftUI
//
//@main
//struct SwiftUIFirebase2App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct SwiftUIFirebase2App: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
}
