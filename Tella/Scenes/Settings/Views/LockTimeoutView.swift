//  Tella
//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import SwiftUI

struct LockTimeoutView: View {
    
    @EnvironmentObject var sheetManager: SheetManager
    @EnvironmentObject var settingsViewModel : SettingsViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                TitleView()
                
                Spacer()
                    .frame(height: 30)
                
                LockTimeoutOptionsView()
                
            }.padding(EdgeInsets(top: 21, leading: 24, bottom: 0, trailing: 24))
            
            Spacer()
            
            BottomButtonsView()
        }
    }
}

struct TitleView : View {
    
    var body: some View {
        
        Text(Localizable.Settings.settLockTimeoutSheetTitle)
            .font(.custom(Styles.Fonts.boldFontName, size: 16))
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
        
        Spacer()
            .frame(height: 10)
        
        Text(Localizable.Settings.settLockTimeoutSheetExpl)
            .font(.custom(Styles.Fonts.regularFontName, size: 14))
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
    }
}

struct LockTimeoutOptionsView : View {
    
    @EnvironmentObject var sheetManager: SheetManager
    @EnvironmentObject var settingsViewModel : SettingsViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            
            ForEach(0..<settingsViewModel.lockTimeoutOptions.count, id:\.self) { index in
                
                Button {
                    settingsViewModel.selectedLockTimeoutOption = settingsViewModel.lockTimeoutOptions[index].lockTimeoutOption
                } label: {
                    LockTimeoutOptionView(index: index)
                }
            }
        }
    }
}

struct LockTimeoutOptionView : View {
    
    var index: Int
    @EnvironmentObject var settingsViewModel : SettingsViewModel

    var body: some View {
        HStack(spacing: 15) {
            
            settingsViewModel.lockTimeoutOptions[index].isSelected ? Image("radio_selected") : Image("radio_unselected")
            
            Text(settingsViewModel.lockTimeoutOptions[index].lockTimeoutOption.displayName)
                .font(.custom(Styles.Fonts.regularFontName, size: 14))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
    }
}

struct BottomButtonsView : View {
    
    @EnvironmentObject var sheetManager: SheetManager
    @EnvironmentObject var settingsViewModel : SettingsViewModel
    
    var body: some View {
        HStack {
            
            Spacer()
            
            Button {
                sheetManager.hide()
            } label: {
                Text(Localizable.Settings.settLockTimeoutCancelSheetAction)
                    .font(.custom(Styles.Fonts.semiBoldFontName, size: 14))
                    .foregroundColor(.white)
            }.padding()
            
            Button {
                settingsViewModel.saveLockTimeout()
                sheetManager.hide()
            } label: {
                Text(Localizable.Settings.settLockTimeoutSaveSheetAction)
                    .font(.custom(Styles.Fonts.semiBoldFontName, size: 14))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.trailing)
                
            }.padding()
            
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
        
    }
}

struct LockTimeoutView_Previews: PreviewProvider {
    static var previews: some View {
        LockTimeoutView()
            .background(Styles.Colors.backgroundMain)
    }
}
