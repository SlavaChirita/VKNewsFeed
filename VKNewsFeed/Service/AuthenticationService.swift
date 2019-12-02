//
//  AuthenticationService.swift
//  VKNewsFeed
//
//  Created by Veaceslav Chirita on 11/11/19.
//  Copyright © 2019 Veaceslav Chirita. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

final class AuthenticationService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "7172257"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("init")
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline", "photos", "wall", "friends"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                delegate?.authServiceSignIn()
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("auth problems state \(state)")
                delegate?.authServiceDidSignInFail()
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            self.delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        self.delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
    
    
}
