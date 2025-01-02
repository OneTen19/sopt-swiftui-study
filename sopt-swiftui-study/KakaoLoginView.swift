//
//  KakaoLoginView.swift
//  sopt-swiftui-study
//
//  Created by OneTen on 12/28/24.
//

import SwiftUI

import AuthenticationServices

struct KakaoLoginView: View {
    @StateObject var viewModel = KakaoLoginViewModel()
    
    let loginStateInfo: (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "카카오 로그인 됐습니다" : "카카오 로그아웃 됐습니다"
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Text(loginStateInfo(viewModel.isLoggedIn))
                
                Button("카카오 로그인") {
                    viewModel.handleKakaoLogin()
                }
                
                Button("카카오 로그아웃"){
                    viewModel.kakaoLogout()
                }
                
                NavigationLink {
                    PhotosPickerExampleView()
                } label: {
                    Text("사진 선택 뷰")
                }

                
            }
            .padding()
        }
    }
}

#Preview {
    KakaoLoginView()
}
