//
//  SettingsView.swift
//  Tella
//
//  Created by Oliphant, Samuel on 2/17/20.
//  Copyright © 2020 Anessa Petteruti. All rights reserved.
//


import SwiftUI

struct SettingsView: View {
    
    let back: Button<AnyView>
    
    var body: some View {
        return Group {
            header(back, "SETTINGS")
            VStack {
                Spacer().frame(maxHeight: 30)
                HStack {
                    smallLabeledImageButton(.KEY, "Change password") {
                        print("change password button pressed")
                    }
                    Spacer()
                }
                Spacer().frame(maxHeight: 15)
                HStack {
                    smallLabeledImageButton(.KEYTYPE, "Change password type") {
                        print("change password type button pressed")
                    }
                    Spacer()
                }
            }
            Spacer()
        }
    }
}
