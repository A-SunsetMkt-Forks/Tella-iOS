//
//  GalleryView.swift
//  Tella
//
//  Created by Oliphant, Samuel on 2/17/20.
//  Copyright © 2020 Anessa Petteruti. All rights reserved.
//

import SwiftUI

struct GalleryView: View {
    
    let back: Button<AnyView>
    
    var body: some View {
        return Group {
            header(back, "GALLERY")
            Spacer().frame(maxHeight: 50)
            HStack {
                smallLabeledImageButton(.LIST, "List view") {
                    print("list icon pressed")
                }
                Spacer().frame(maxWidth: 40)
                smallLabeledImageButton(.GRID, "Grid view") {
                    print("grid icon pressed")
                }
            }
            Spacer()
            List(TellaFileManager.getEncryptedFileNames().map({ (value: String) -> File in File(name: value) })) { file in
                smallText(file.name)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    print("plus icon pressed")
                }) {
                    bigImg(.PLUS)
                }
            }
        }
    }
}

struct File: Identifiable {
    var id = UUID()
    var name: String
}

struct FileRow: View {
    var file: File

    var body: some View {
        smallText(file.name)
    }
}
