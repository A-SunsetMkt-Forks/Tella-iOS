//
//  SettingsMainView.swift
//  Tella
//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import SwiftUI

struct SettingsMainView: View {
    
    @ObservedObject var appModel : MainAppModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var settingsViewModel : SettingsViewModel
    
    init(appModel:MainAppModel) {
        _settingsViewModel = StateObject(wrappedValue: SettingsViewModel(appModel: appModel))
        self.appModel = appModel
    }
    
    var body: some View {
        ContainerView {
            VStack() {
                GeneralSettingsView(appModel: appModel)
                    .environmentObject(settingsViewModel)
                RecentFilesSettingsView()
                Spacer()
            }
        }.onReceive(appModel.shouldUpdateLanguage) {  vv in
            if vv {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .toolbar {
            LeadingTitleToolbar(title: Localizable.Settings.appBar)
        }
        
        .onDisappear(perform: {
            appModel.saveSettings()
        })
        
        .onDisappear {
            appModel.publishUpdates()
        }
    }
}

struct GeneralSettingsView : View {
    
    @State private var presentingLanguage = false
    @ObservedObject var appModel : MainAppModel
    @StateObject var lockViewModel = LockViewModel(unlockType: .update)
    @State var passwordTypeString : String = ""
    @EnvironmentObject private var sheetManager: SheetManager
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body : some View {
        
        VStack(spacing: 0) {
            
            SettingsItemView(imageName: "settings.language",
                             title: Localizable.Settings.settLanguage,
                             value: Language.currentLanguage.name)
            .onTapGesture {
                presentingLanguage = true
            }
            
            DividerView()
            
            SettingsItemView(imageName: "settings.lock",
                             title: Localizable.Settings.settLock,
                             value: passwordTypeString)
            
            .navigateTo(destination: unlockView)
            
            
            DividerView()
            
            SettingsItemView(imageName: "settings.timeout",
                             title: "Lock timeout",
                             value: appModel.settings.lockTimeout.displayName)
            .onTapGesture {
                showLockTimeout()
            }
            
            DividerView()
            
            SettingsItemView(imageName: "settings.help",
                             title: Localizable.Settings.settAbout,
                             value: "")
            .navigateTo(destination: AboutAndHelpView()
                .environmentObject(settingsViewModel))
            
        }.background(Color.white.opacity(0.08))
            .cornerRadius(15)
            .padding()
            .fullScreenCover(isPresented: $presentingLanguage) {
                
            } content: {
                LanguageListView(isPresented: $presentingLanguage)
            }
            .onAppear {
                lockViewModel.shouldDismiss.send(false)
                let passwordType = AuthenticationManager().getPasswordType()
                passwordTypeString = passwordType == .tellaPassword ? Localizable.Lock.lockSelectActionPassword : Localizable.Lock.lockSelectActionPin
            }
    }
    
    var unlockView : some View {
        
        let passwordType = AuthenticationManager().getPasswordType()
        return passwordType == .tellaPassword ?
        
        UnlockPasswordView()
            .environmentObject(lockViewModel)
            .eraseToAnyView()  :
        
        UnlockPinView()
            .environmentObject(lockViewModel)
            .eraseToAnyView()
        
    }
    
    func showLockTimeout() {
        sheetManager.showBottomSheet(modalHeight: 408) {
            LockTimeoutView()
                .environmentObject(settingsViewModel)
        }
    }
}

struct RecentFilesSettingsView : View {
    
    @EnvironmentObject var appModel : MainAppModel
    
    var body : some View {
        
        VStack(spacing: 0) {
            
            SettingToggleItem(title: Localizable.Settings.settRecentFiles,
                              description: Localizable.Settings.settRecentFilesExpl,
                              toggle: $appModel.settings.showRecentFiles)
        }.background(Color.white.opacity(0.08))
            .cornerRadius(15)
            .padding()
    }
}

struct DividerView : View {
    var body: some View {
        Divider()
            .frame(height: 1)
            .background(Color.white.opacity(0.2))
    }
    
}

struct SettingsItemView : View {
    
    var imageName : String = ""
    var title : String = ""
    var value : String = ""
    
    var body : some View {
        
        HStack {
            Image(imageName)
            Spacer()
                .frame(width: 10)
            Text(title)
                .font(.custom(Styles.Fonts.regularFontName, size: 14))
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .font(.custom(Styles.Fonts.regularFontName, size: 14))
                .foregroundColor(.white)
            
        }.padding(.all, 18)
            .contentShape(Rectangle())
    }
}

struct SettingsMainView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMainView(appModel: MainAppModel())
    }
}
