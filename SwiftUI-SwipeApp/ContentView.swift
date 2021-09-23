//
//  ContentView.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/23.
//

import SwiftUI

struct ContentView: View {
    
    private let frameWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    
                }, label: {
                    // ボタンのイメージプロパティ
                    Image(systemName: "flame.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.red)
                })
                // ボタンプロパティ
                .frame(width: frameWidth / 4 - 20)
                .padding(.leading, 30)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "suit.diamond.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.yellow)
                })
                .frame(width: frameWidth / 4)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bubble.left.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.orange)
                })
                .frame(width: frameWidth / 4)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.purple)
                })
                .frame(width: frameWidth / 4 - 20)
                .padding(.trailing, 30)
                
            }
            // Stackプロパティ
            .padding()
            .frame(width: frameWidth)
            
            Text("Hello, world!")
                .padding()
                .frame(width: frameWidth)
                .background(Color.blue)
            Text("Hello, world!")
                .padding()
                .frame(width: frameWidth)
                .background(Color.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
