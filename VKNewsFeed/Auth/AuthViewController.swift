//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Veaceslav Chirita on 11/11/19.
//  Copyright © 2019 Veaceslav Chirita. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthenticationService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        authService = AuthenticationService()
        authService = AppDelegate.shared().authService
    }
    

    @IBAction func signInTouch(_ sender: UIButton) {
        print("123")
        authService.wakeUpSession()
    }
}
