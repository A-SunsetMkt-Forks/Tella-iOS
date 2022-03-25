//
//  FileGridItem.swift
//  Tella
//
//
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

struct FileGridItem: View {
    
    var file: VaultFile
    
    @EnvironmentObject var appModel: MainAppModel
    @EnvironmentObject var fileListViewModel : FileListViewModel
    
    var body: some View {
        GeometryReader { geometryReader in
            
            ZStack {
                
                file.gridImage
                
                VStack(alignment: .trailing) {
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            fileListViewModel.showingFileActionMenu = true
                            fileListViewModel.updateSingleSelection(for: file)
                            
                        } label: {
                            Image("files.more")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: -6, trailing: -12))
                        }.frame(width: 35, height: 35)
                    }
                }
                
                if fileListViewModel.selectingFiles {
                    Color.black.opacity(0.32)
                        .onTapGesture {
                            fileListViewModel.updateSelection(for: file)
                        }
                        .frame(width: geometryReader.size.width, height: geometryReader.size.height)
                    
                    HStack() {
                        
                        VStack(alignment: .leading) {
                            Image(fileListViewModel.getStatus(for: file) ? "files.selected" : "files.unselected")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding(EdgeInsets(top: 6, leading: 6, bottom: 0, trailing: 0))
                            Spacer()
                            
                        }.onTapGesture {
                            fileListViewModel.updateSelection(for: file)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct FileGridItem_Previews: PreviewProvider {
    static var previews: some View {
        FileGridItem(file: VaultFile.stub(type: .folder))
            .environmentObject(MainAppModel())
            .environmentObject(FileListViewModel.stub())
        
    }
}
