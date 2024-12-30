//
//  KakaoLoginViewModel.swift
//  sopt-swiftui-study
//
//  Created by OneTen on 12/30/24.
//

import SwiftUI

import Combine
import KakaoSDKUser

@MainActor
class KakaoLoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func handleKakaoLogin() {
        Task {
            // 카카오톡 설치되어 있을 떄
            if (UserApi.isKakaoTalkLoginAvailable()) {
                // 카카오톡 앱으로 로그인
                isLoggedIn = await handleLoginWithKakaoTalkApp()
            } else { // 카카오톡 설치 안 되어 있을 때
                // 카카오톡 계정으로 로그인
                isLoggedIn = await handleLoginWithKakaoTalkAccount()
            }
        }
    }
    
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                isLoggedIn = false
            }
        }
    }
    
    func handleLoginWithKakaoTalkApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    // 성공 시 동작 구현
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoTalkAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    // 성공 시 동작 구현
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    
}
