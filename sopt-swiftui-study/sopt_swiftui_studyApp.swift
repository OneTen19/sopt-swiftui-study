//
//  sopt_swiftui_studyApp.swift
//  sopt-swiftui-study
//
//  Created by OneTen on 12/28/24.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

@main
struct sopt_swiftui_studyApp: App {
    
    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
    
    init() {
        let kakaoAppKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_NATIVE_APP_KEY") ?? ""
        
        print("kakaoAppKey : \(kakaoAppKey)")
        
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }
    
    var body: some Scene {
        WindowGroup {
            // onOpenURL()을 사용해 커스텀 URL 스킴 처리
            KakaoLoginView().onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
