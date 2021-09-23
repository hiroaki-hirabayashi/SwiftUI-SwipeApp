//
//  ContentView.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/23.
//

import SwiftUI

struct ContentView: View {
    
    enum SelectedItem {
        case check, good, comment, profile
    }
    
    private let frameWidth = UIScreen.main.bounds.width
    private let buttonImageSize: CGFloat = 30
    // データバインディング ここの値が変更されたら参照している箇所も変更される
    @State var selectedItem: SelectedItem = .good
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    selectedItem = .check
                }, label: {
                    // ボタンのイメージプロパティ
                    Image(systemName: "flame.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: buttonImageSize, height: buttonImageSize, alignment: .center)
                        .foregroundColor(selectedItem == .check ? .red : .gray)
                })
                // ボタンプロパティ
                .frame(width: frameWidth / 4 - 20)
                .padding(.leading, 30)
                
                Button(action: {
                    selectedItem = .good
                }, label: {
                    Image(systemName: "suit.diamond.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: buttonImageSize, height: buttonImageSize, alignment: .center)
                        .foregroundColor(selectedItem == .good ? .yellow : .gray)
                })
                .frame(width: frameWidth / 4)
                
                Button(action: {
                    selectedItem = .comment
                }, label: {
                    Image(systemName: "bubble.left.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: buttonImageSize, height: buttonImageSize, alignment: .center)
                        .foregroundColor(selectedItem == .comment ? .orange : .gray)
                })
                .frame(width: frameWidth / 4)
                
                Button(action: {
                    selectedItem = .profile
                }, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: buttonImageSize, height: buttonImageSize, alignment: .center)
                        .foregroundColor(selectedItem == .profile ? .purple : .gray)
                })
                .frame(width: frameWidth / 4 - 20)
                .padding(.trailing, 30)
                
            }
            // Stackプロパティ
            .padding()
            .frame(width: frameWidth)
            
            Text("Hello, world!")
                .padding()
                .frame(width: frameWidth, height: 600)
                .background(Color.blue)
            
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
                .frame(width: backgroundSize, height: backgroundSize)
                .cornerRadius(backgroundSize)
                .shadow(radius: 10)
           
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
