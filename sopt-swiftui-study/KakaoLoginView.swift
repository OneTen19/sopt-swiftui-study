//
//  KakaoLoginView.swift
//  sopt-swiftui-study
//
//  Created by OneTen on 12/28/24.
//

import SwiftUI

struct KakaoLoginView: View {
    @StateObject var viewModel = KakaoLoginViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, world!")
            
            Button("카카오 로그인") {
                viewModel.handleKakaoLogin()
            }
            
            Button("카카오 로그아웃"){
                
            }
            
        }
        .padding()
    }
}

#Preview {
    KakaoLoginView()
}
