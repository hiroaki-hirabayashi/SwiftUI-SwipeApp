//
//  SignInView.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/24.
//

import SwiftUI

struct SignInView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                // hex color E3324F / ED9764
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8901960784, green: 0.1960784314, blue: 0.3098039216, alpha: 1)), Color(#colorLiteral(red: 0.9294117647, green: 0.5921568627, blue: 0.3921568627, alpha: 1))]), startPoint: .center, endPoint: .bottom)
                    // セーフエリアまで全部
                    .ignoresSafeArea()
                
                VStack(spacing: 25) {
                    
                    // Binding ここで入力した値を渡す
                    Text("登録画面")
                        .font(.system(size: 50, weight: .heavy))
                        .foregroundColor(.white)
                    TextField("名前", text: $name)
                        .asSignInTextField()
                    TextField("メールアドレス", text: $email)
                        .asSignInTextField()
                    TextField("パスワード", text: $password)
                        .asSignInTextField()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("登録")
                            .foregroundColor(.white)
                    })
                    .frame(width: 200, height: 50)
                    // hex color E3324F
                    .background(Color(#colorLiteral(red: 0.8901960784, green: 0.1960784314, blue: 0.3098039216, alpha: 1)))
                    .cornerRadius(10)
                    
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("すでにアカウントをお持ちの方はこちら")
                                .font(.system(size: 15))
                        })
                }
                .padding(.horizontal, 50)
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct SingInTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 50)
            // プレースホルダーの余白
            .padding(.leading, 10)
            .textFieldStyle(PlainTextFieldStyle())
            .background(Color.white)
            .cornerRadius(5)
            // 枠線
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(.init(white: 0.85, alpha: 1))))
    }
}

extension View {
    func asSignInTextField() -> some View {
        modifier(SingInTextFieldModifier())
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
