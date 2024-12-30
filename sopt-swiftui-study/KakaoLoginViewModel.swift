//
//  KakaoLoginViewModel.swift
//  sopt-swiftui-study
//
//  Created by OneTen on 12/30/24.
//

import SwiftUI

import Combine
import KakaoSDKUser

class KakaoLoginViewModel: ObservableObject {
    
    func kakaoLogin() {
        // 카카오톡앱이 설치되어 있을 경우
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // 성공 시 동작 구현
                    _ = oauthToken
                }
            }
        } else { // 카카오톡앱이 설치되어 있지 않을 경우
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    // 성공 시 동작 구현
                    _ = oauthToken
                }
            }
        }
    }
    
    func kakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    
    
}
