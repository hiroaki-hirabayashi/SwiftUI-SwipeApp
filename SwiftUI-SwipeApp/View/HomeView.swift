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
    
//    @State var translation: CGSize = .zero
//    @State var numbers = [0, 1, 2, 3, 4, 5]
//    @State var goodOpacity: Double = 0
//    @State var nopeOpacity: Double = 0
    // CardViewModelを呼び出す シングルトンみたいなもの 値が変わることのない値
    @EnvironmentObject var vm: CardViewModel
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            
            ForEach(vm.numbers, id: \.self) { number in
                CardDetailView(number: number, geometry: geometry)
                // 位置をずらす
                .offset(vm.numbers.last == number ? vm.translation : .zero)
                // 傾けさせる
                    .rotationEffect(vm.numbers.last == number ? .degrees(Double(vm.translation.width / 300 * 20)) : .zero)
                // スワイプアクション
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            //  ドラックした位置を取得
                            print("value.location: \(value.location)")
                            dragOnChange(value: value)
                        })
                        // ドラックを離した時
                        .onEnded({ value in
                            dragOnEnd(value: value)
                        })
                )
                // アニメーション
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1))
            }
        })
    }
    // CardViewをドラッグ中
    private func dragOnChange(value: DragGesture.Value) {
        vm.translation = value.translation
        let diffValue = value.startLocation.x - value.location.x
        let ratio: CGFloat = 1 / 150
        let opacity = diffValue * ratio
        
//        vm.goodOpacity = Double(opacity)
        
        // 左にスワイプ
        if value.location.x < value.startLocation.x {
            vm.nopeOpacity = Double(opacity)
            vm.goodOpacity = .zero
        // 右にスワイプ
        } else if value.location.x > value.startLocation.x {
            vm.goodOpacity = Double(-opacity)
            vm.nopeOpacity = .zero
        }
    }
    
    // CardViewのドラッグ終了
    private func dragOnEnd(value: DragGesture.Value) {
        
        vm.goodOpacity = .zero
        vm.nopeOpacity = .zero
        
        if value.startLocation.x - 150 > value.location.x {
            // 左側にフェードアウトする
            vm.translation = .init(width: -800, height: 0)
            // ドラッグを離してから0.3秒後に処理が走る
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                vm.numbers.removeLast()
                vm.translation = .zero
            }
        } else if value.startLocation.x + 150 < value.location.x {
            // 右側にフェードアウトする
            vm.translation = .init(width: 800, height: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                vm.numbers.removeLast()
                vm.translation = .zero
            }
        } else {
            // 元の位置に戻る
            vm.translation = .zero
        }
    }
}

struct CardDetailView: View {
    
    var number: Int
    var geometry: GeometryProxy
    @EnvironmentObject var vm: CardViewModel
    
    var body: some View {
        
        ZStack {
            ZStack {
                Image("cuu1")
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
                        .opacity(vm.numbers.last == number ? vm.goodOpacity : .zero)
                    
                    Spacer()
                    
                    Text("Nope")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.red)
                        .padding(.all, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.red, lineWidth: 4)
                        )
                        .opacity(vm.numbers.last == number ? vm.nopeOpacity : .zero)
                }
                .padding(.all, 30)
                
                Spacer()
                
                HStack {
                    // テキスト左寄せ
                    VStack(alignment: .leading) {
                        Text("ミニチュア・ダックスフンド")
                            .foregroundColor(.white)
                            .font(.system(size: 35, weight: .medium))
                        
                        Text("出身: 東京都")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .medium))
                        
                        Text("女の子")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .medium))
                        
                        Text("1歳")
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
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CardViewModel())
    }
}
