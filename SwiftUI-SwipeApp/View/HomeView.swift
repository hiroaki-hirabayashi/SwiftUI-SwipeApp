//
//  ContentView.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/23.
//

import SwiftUI

struct HomeView: View {
    
    private let frameWidth = UIScreen.main.bounds.width
    private let buttonImageSize: CGFloat = 30
    
    var body: some View {
        VStack {
            
            TopControlView()

            CardView()
            
            BottomControlView()
           
        }
    }
}

struct CardView: View {
    var body: some View {
      
        
        
        GeometryReader(content: { geometry in
            
            ZStack {
                ZStack {
                    Image("reload")
                        .resizable()
                        .scaledToFill()
                        .background(Color.white)
                    
                    // フェード処理
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                }
                // Viewの幅
                .frame(width: geometry.size.width - 20, height: geometry.size.height)
                .cornerRadius(10)
                .padding(.all, 10)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
               
                VStack {
                    
                    HStack {
                        Text("Good")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(.green)
                            // ここのpaddingはTextと枠の距離
                            .padding(.all, 5)
                            // 枠
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.green, lineWidth: 4)
                            )
                        
                        Spacer()
                        
                        Text("Nope")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(.red)
                            .padding(.all, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.red, lineWidth: 4)
                            )
                    }
                    .padding(.all, 30)
                    
                    Spacer()
                    
                    HStack {
                        // テキスト左寄せ
                        VStack(alignment: .leading) {
                            Text("東京都")
                                .foregroundColor(.white)
                                .font(.system(size: 45, weight: .heavy))
                            
                            Text("Tokyo")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                            
                            Text("大田区")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .medium))
                            
                            Text("O-taku")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .medium))
                        }
                        // 左から20余白
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                            
                        })
                        // 右から50余白
                        .padding(.trailing, 50)
                    }
                    .frame(width: geometry.size.width - 20)
                    .padding(.bottom, 40)
                }
               
            }
            
            
            
        })
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}