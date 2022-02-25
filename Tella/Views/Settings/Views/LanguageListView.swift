//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import SwiftUI

struct LanguageListView: View {
    
    @Binding var isPresented : Bool
    @StateObject var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        ContainerView {
            
            VStack {
                
                LanguageHeaderView(isPresented: $isPresented)
                
                List {
                    ForEach(settingsViewModel.languageItems, id:\.self) {item in
                        LanguageItemView(languageItem: item, settingsViewModel: settingsViewModel,
                                         isPresented: $isPresented)
                        
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct LanguageHeaderView : View {
    
    @Binding var isPresented : Bool
    
    var body: some View {
        
        HStack {
            Button {
                isPresented = false
            } label: {
                Image("close")
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 12))
            
            Text(LocalizableSettings.language.localized)
                .font(.custom(Styles.Fonts.semiBoldFontName, size: 18))
                .foregroundColor(Color.white)
            Spacer()
        }
        
    }
}


struct LanguageItemView : View {
    
    var languageItem : Language
    @StateObject var settingsViewModel :  SettingsViewModel
    
    @Binding var isPresented : Bool
    
    @EnvironmentObject private var appViewState: AppViewState
    
    var body: some View {
        
        ZStack {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(languageItem.name)
                        .font(.custom(Styles.Fonts.regularFontName, size: 15))
                        .foregroundColor(.white)
                    
                    Text(languageItem.englishName)
                        .font(.custom(Styles.Fonts.regularFontName, size: 12))
                        .foregroundColor(.white)
                }
                
                Spacer()
                if languageItem.code == Language.currentLanguage.code {
                    Image("settings.done")
                }
                
            }
            Button("") {
                
                
                
                Language.currentLanguage = languageItem
                
                appViewState.resetToMain()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPresented = false
                }
            }
            
        }.padding(EdgeInsets(top: 7, leading: 20, bottom: 11, trailing: 16))
            .frame(height: 52)
            .listRowBackground(languageItem.code == Language.currentLanguage.code ? Color.white.opacity(0.15) : Color.clear )
            .listRowInsets(EdgeInsets())
    }
}

struct LanguageListView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageListView(isPresented: .constant(true))
    }
}