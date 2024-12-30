//
//  MyAppDelegate.swift
//  sopt-swiftui-study
//
//  Created by OneTen on 12/30/24.
//

import UIKit

import KakaoSDKAuth

class MyAppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
        
        return false
    }

}
