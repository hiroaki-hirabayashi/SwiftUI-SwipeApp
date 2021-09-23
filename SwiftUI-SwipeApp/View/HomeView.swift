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

            Text("Hello, world!")
                .padding()
                .frame(width: frameWidth, height: 600)
                .background(Color.blue)
            
            BottomControlView()
           
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
