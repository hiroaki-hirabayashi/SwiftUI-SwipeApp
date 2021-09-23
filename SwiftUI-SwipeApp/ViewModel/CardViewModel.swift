//
//  CardViewModel.swift
//  SwiftUI-SwipeApp
//
//  Created by 平林 宏淳 on 2021/09/24.
//

import SwiftUI

class CardViewModel: ObservableObject {
   
    @Published var translation: CGSize = .zero
    @Published var numbers = [0, 1, 2, 3, 4, 5]
    @Published var goodOpacity: Double = 0
    @Published var nopeOpacity: Double = 0
    
    init() {
        
    }
}

