//
//  SwiftUI-SwipeApp.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/24.
//

import SwiftUI

@main
struct SwiftUISwipeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                // 先に宣言しておく
                .environmentObject(CardViewModel())
        }
    }
}
