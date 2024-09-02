//
//  AppDelegateClass.swift
//  
//
//  Created by Brandon Shippy on 2024/08/11.
//

import UIKit
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Load the clientID from your specific plist file
        if let path = Bundle.main.path(forResource: "AuthCode", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path),
           let clientID = dict["CLIENT_ID"] as? String {
            
            // Initialize Google Sign-In configuration
            let signInConfig = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = signInConfig
            
            // Restore the user's previous sign-in state
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error = error {
                    print("Error restoring previous sign-in: \(error.localizedDescription)")
                } else {
                    // User is signed in, update the UI or store user info as needed
                    print("Restored previous sign-in for user: \(user?.profile?.name ?? "Unknown User")")
                }
            }
        } else {
            fatalError("Could not find CLIENT_ID in your plist file")
        }
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
