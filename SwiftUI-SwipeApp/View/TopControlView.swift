//
//  TopControlView.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/23.
//

import SwiftUI

struct TopControlView: View {
    
    enum SelectedItem {
        case check, good, comment, profile
    }
    
    private let frameWidth = UIScreen.main.bounds.width
    // データバインディング ここの値が変更されたら参照している箇所も変更される
    @State var selectedItem: SelectedItem = .good
    
    var body: some View {
        HStack {
            Button(action: {
                // 初期値
                selectedItem = .check
            }, label: {
                // ボタンのイメージプロパティ
                Image(systemName: "flame.fill")
                    .asTopControlButtonImage()
                    .foregroundColor(selectedItem == .check ? .red : .gray)
            })
            // ボタンプロパティ
            .frame(width: frameWidth / 4 - 20)
            .padding(.leading, 30)
            
            Button(action: {
                selectedItem = .good
            }, label: {
                Image(systemName: "suit.diamond.fill")
                    .asTopControlButtonImage()
                    .foregroundColor(selectedItem == .good ? .yellow : .gray)
            })
            .frame(width: frameWidth / 4)
            
            Button(action: {
                selectedItem = .comment
            }, label: {
                Image(systemName: "bubble.left.fill")
                    .asTopControlButtonImage()
                    .foregroundColor(selectedItem == .comment ? .orange : .gray)
            })
            .frame(width: frameWidth / 4)
            
            Button(action: {
                selectedItem = .profile
            }, label: {
                Image(systemName: "person.crop.circle.fill")
                    .asTopControlButtonImage()
                    .foregroundColor(selectedItem == .profile ? .purple : .gray)
            })
            .frame(width: frameWidth / 4 - 20)
            .padding(.trailing, 30)
        }
        // Stackプロパティ
        .padding()
        .frame(width: frameWidth)
    }
}

extension Image {

    func asTopControlButtonImage() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30, alignment: .center)
    }
    
}
