//
//  AppDelegate.swift
//  VKNewsFeed
//
//  Created by Veaceslav Chirita on 11/11/19.
//  Copyright © 2019 Veaceslav Chirita. All rights reserved.
//

import UIKit
import VKSdkFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AuthServiceDelegate {
    var window: UIWindow?
    var authService: AuthenticationService!
    
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.authService = AuthenticationService()
        window = UIWindow()
        authService.delegate = self
        
        let authVC: AuthViewController = AuthViewController.loadFromStoryBoard()
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
        
        return true
    }
    
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }
    
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSignIn() {
        print(#function)
        let feedVC: NewsfeedViewController = NewsfeedViewController.loadFromStoryBoard()
        let navigationVC = UINavigationController(rootViewController: feedVC)
        window?.rootViewController = navigationVC
    }
    
    func authServiceDidSignInFail() {
        print(#function)
    }
}

