//
//  BottomControlView.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/23.
//

import SwiftUI

struct BottomControlView: View {
    
    private let frameWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack(spacing: 20) {
            BottomButtonView(imageName: "reload", imageSize: 20, backgroundSize: 50)
            BottomButtonView(imageName: "close", imageSize: 25, backgroundSize: 60)
            BottomButtonView(imageName: "star", imageSize: 20, backgroundSize: 50)
            BottomButtonView(imageName: "heart", imageSize: 25, backgroundSize: 60)
            BottomButtonView(imageName: "light", imageSize: 20, backgroundSize: 50)
        }
        // タブエリアの範囲を決める
        .padding()
        .frame(width: frameWidth)
    }
}

struct BottomButtonView: View {
    // タブボタンのプロパティ参照用
    var imageName: String
    var imageSize: CGFloat
    var backgroundSize: CGFloat
    
    var body: some View {
        
        ZStack {
            // タブボタンのプロパティ
            Color.white
                .asRoundShadow(size: backgroundSize)
           
            Button(action: {
                
            }, label: {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize, alignment: .center)
            })
        }
        
    }
}

struct BottomButtonModifire: ViewModifier {
    
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .cornerRadius(size)
            .shadow(radius: 10)
    }
}

extension View {
    
    func asRoundShadow(size: CGFloat) -> some View {
        modifier(BottomButtonModifire(size: size))
    }
}
