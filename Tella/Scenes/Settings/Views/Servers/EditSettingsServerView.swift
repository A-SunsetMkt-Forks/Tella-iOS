//  Tella
//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import SwiftUI

struct EditSettingsServerView: View {
    
    @Binding var isPresented : Bool
    
    @EnvironmentObject var serversViewModel : ServersViewModel
    
    var body: some View {
        
        ContainerView {
            
            VStack {
                
                editServerHeaderView
                
                SettingsCardView(cardViewArray: [serverNameView.eraseToAnyView(),
                                                 serverURLView.eraseToAnyView(),
                                                 serverUsernameView.eraseToAnyView(),
                                                 ShareInfoView(shareInfo: $serversViewModel.currentServer.activatedMetadata).eraseToAnyView(),
                                                 BackgroundUploadView(backgroundUpload: $serversViewModel.currentServer.backgroundUpload).eraseToAnyView()])
                Spacer()
                
                bottomView
            }
        }
    }
    
    var serverNameView: some View {
        EditServerDisplayItem(title: "Server name", description: serversViewModel.currentServer.name)
    }
    
    var serverURLView: some View {
        EditServerDisplayItem(title: "Server URL", description: serversViewModel.currentServer.url)
    }
    
    var serverUsernameView: some View {
        EditServerDisplayItem(title: "Username", description: serversViewModel.currentServer.username)
    }
    
    var editServerHeaderView : some View {
        
        HStack {
            Button {
                isPresented = false
            } label: {
                Image("close")
            }.padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
            
            Text("Edit server")
                .font(.custom(Styles.Fonts.semiBoldFontName, size: 20))
                .foregroundColor(Color.white)
            
            Spacer()
            
        }.padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
        
    }
    
    var bottomView : some View {
        
        HStack(spacing: 16) {
            Spacer()
            Button {
                isPresented = false
                
            } label: {
                Text("CANCEL")
                    .font(.custom(Styles.Fonts.semiBoldFontName, size: 14))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                    .background(Color(UIColor(hexValue: 0xF5F5F5)).opacity(0.16))
                    .cornerRadius(25)
            }
            
            Button {
                isPresented = false
                serversViewModel.updateServer()
            } label: {
                Text("SAVE")
                    .font(.custom(Styles.Fonts.semiBoldFontName, size: 14))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                    .background(Styles.Colors.yellow)
                    .cornerRadius(25)
                
            }
            
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        
    }
}


struct EditSettingsServerView_Previews: PreviewProvider {
    static var previews: some View {
        EditSettingsServerView(isPresented: .constant(true))
    }
}




