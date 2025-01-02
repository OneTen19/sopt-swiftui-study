//
//  PhotosPickerExampleView.swift
//  sopt-swiftui-study
//
//  Created by OneTen on 1/2/25.
//

import SwiftUI

import PhotosUI

struct PhotosPickerExampleView: View {
    @State private var selectedImagesData: [Data] = [] // 선택된 사진의 데이터
    @State private var selectedItemIdentifiers: [PhotosPickerItem] = [] // 선택된 PhotosPickerItem
    
    var body: some View {
        NavigationStack {
            VStack {
                // 사진 선택 버튼
                PhotosPicker(
                    selection: $selectedItemIdentifiers,
                    maxSelectionCount: 10, // 최대 선택 가능 사진 수
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("사진 선택")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .onChange(of: selectedItemIdentifiers) { newItems in
                    selectedImagesData = [] // 이전 선택 항목 초기화
                    for item in newItems {
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data?):
                                selectedImagesData.append(data) // 이미지 데이터를 추가
                            case .success(nil):
                                print("사진 데이터 없음")
                            case .failure(let error):
                                print("사진 로드 에러: \(error.localizedDescription)")
                            }
                        }
                    }
                }
                
                // 선택한 사진을 보여주는 뷰
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                        ForEach(selectedImagesData, id: \.self) { imageData in
                            if let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Photos Picker")
        }
    }
}
