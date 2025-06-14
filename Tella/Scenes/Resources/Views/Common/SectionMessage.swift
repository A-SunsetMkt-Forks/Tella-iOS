//
//  SectionMessage.swift
//  Tella
//
//  Created by gus valbuena on 2/2/24.
//  Copyright © 2024 HORIZONTAL. 
//  Licensed under MIT (https://github.com/Horizontal-org/Tella-iOS/blob/develop/LICENSE)
//


import SwiftUI

struct SectionMessage: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.custom(Styles.Fonts.regularFontName, size: 14))
            .fontWeight(.regular)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    SectionMessage(text: "Hello")
}
