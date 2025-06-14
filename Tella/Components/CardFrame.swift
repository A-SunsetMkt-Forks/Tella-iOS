//
//  CardFrame.swift
//  Tella
//
//  Created by Dhekra Rouatbi on 18/12/2024.
//  Copyright © 2024 HORIZONTAL. 
//  Licensed under MIT (https://github.com/Horizontal-org/Tella-iOS/blob/develop/LICENSE)
//


import SwiftUI

struct CardFrameModifier: ViewModifier {
    func body(content: Content) -> some View {
             content
            .background(Color.white.opacity(0.08))
            .cornerRadius(15)
     }
}

extension View {
    func cardFrameStyle() -> some View {
        self.modifier(CardFrameModifier())
    }
}
