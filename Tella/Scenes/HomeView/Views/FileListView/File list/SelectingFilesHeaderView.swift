//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import SwiftUI

struct SelectingFilesHeaderView: View {
    
    @EnvironmentObject var fileListViewModel : FileListViewModel
    
    var body: some View {
        if  fileListViewModel.selectingFiles {
            HStack{
                
                closeButton
                
                Spacer()
                    .frame(width: 12)
                
                itemsTitle
                
                Spacer(minLength: 15)
                
                if fileListViewModel.selectedItemsNumber > 0 {
                    
                    shareButton
                    
                    Spacer()
                        .frame(width:30)
                    moreButton
                }
                
            }.padding(EdgeInsets(top: 8, leading: 16, bottom: 4, trailing: 23))
        }
    }
    
    var closeButton: some View {
        Button {
            fileListViewModel.selectingFiles = false
            fileListViewModel.resetSelectedItems()
        } label: {
            Image("close")
        }
        
        .frame(width: 24, height: 24)
        
    }
    
    @ViewBuilder
    var itemsTitle: some View {
        if fileListViewModel.selectedItemsNumber > 0 {
            
            Text(fileListViewModel.selectedItemsTitle)
                .foregroundColor(.white).opacity(0.8)
                .font(.custom(Styles.Fonts.semiBoldFontName, size: 16))
        }
        
    }
    
    @ViewBuilder
    var shareButton: some View {
        if fileListViewModel.shouldActivateShare {
            
            Button {
                fileListViewModel.showingShareFileView = true
            } label: {
                Image("share-icon")
            }
            .frame(width: 24, height: 24)
        }
        
    }
    
    var moreButton: some View {
        Button {
            fileListViewModel.showingFileActionMenu = true
        } label: {
            Image("files.more")
                .renderingMode(.template)
                .foregroundColor((fileListViewModel.selectedItemsNumber == 0) ? .white.opacity(0.5) : .white)
            
        } .frame(width: 24, height: 24)
        
    }
}

struct SelectingFilesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SelectingFilesHeaderView()
    }
}