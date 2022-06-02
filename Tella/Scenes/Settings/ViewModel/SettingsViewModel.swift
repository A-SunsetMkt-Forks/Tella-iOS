//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import Foundation


class SettingsViewModel: ObservableObject {
    
    var appModel : MainAppModel
    
    @Published var languageItems : [Language]
    @Published var lockTimeoutOptions : [LockTimeoutOptionsStatus] = []
    
    var aboutAndHelpItems : [AboutAndHelpItem] = {
        return [AboutAndHelpItem(title: Localizable.Settings.settAboutContactUs,
                                 imageName: "settings.contact-us",
                                 url: TellaUrls.contactURL),
                AboutAndHelpItem(title: Localizable.Settings.settAboutPrivacyPolicy,
                                 imageName: "settings.privacy",
                                 url: TellaUrls.privacyURL)
        ]
    }()
    
    
    var selectedLockTimeoutOption : LockTimeoutOption {
        didSet {
            lockTimeoutOptions.filter{$0.lockTimeoutOption != selectedLockTimeoutOption}.forEach{$0.isSelected = false}
            lockTimeoutOptions.filter{$0.lockTimeoutOption == selectedLockTimeoutOption}.first?.isSelected = true
            self.objectWillChange.send()
        }
    }
    
    init(appModel: MainAppModel) {
        
        self.appModel = appModel
        
        languageItems = Language.allCases.map {$0}
        
        lockTimeoutOptions = [LockTimeoutOptionsStatus(lockTimeoutOption: .immediately, isSelected: false),
                              LockTimeoutOptionsStatus(lockTimeoutOption: .oneMinute, isSelected: false),
                              LockTimeoutOptionsStatus(lockTimeoutOption: .fiveMinutes, isSelected: false),
                              LockTimeoutOptionsStatus(lockTimeoutOption: .thirtyMinutes, isSelected: false),
                              LockTimeoutOptionsStatus(lockTimeoutOption: .onehour, isSelected: false)]
        
        selectedLockTimeoutOption =  appModel.settings.lockTimeout
        lockTimeoutOptions.filter{$0.lockTimeoutOption == appModel.settings.lockTimeout}.first?.isSelected = true
    }
    
    func initLockTimeoutOptions()  {
    }
    
    func saveLockTimeout() {
        appModel.settings.lockTimeout = selectedLockTimeoutOption
        appModel.saveSettings()
    }
}

