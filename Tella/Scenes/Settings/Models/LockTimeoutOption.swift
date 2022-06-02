//  Tella
//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import Foundation

enum LockTimeoutOption : String {
    
    case immediately
    case oneMinute
    case fiveMinutes
    case thirtyMinutes
    case onehour
    
    var displayName: String {
        
        switch self {
        case .immediately:
            return Localizable.Settings.settLockTimeoutImmediatelySheetSelect
        case .oneMinute:
            return Localizable.Settings.settLockTimeoutOneminuteSheetSelect
        case .fiveMinutes:
            return Localizable.Settings.settLockTimeoutFiveMinutesSheetSelect
        case .thirtyMinutes:
            return Localizable.Settings.settLockTimeoutThirtyMinutesSheetSelect
        case .onehour:
            return Localizable.Settings.settLockTimeoutOneHourSheetSelect
        }
    }
    
    var time: Int {
        switch self {
        case .immediately:
            return 0
        case .oneMinute:
            return 60
        case .fiveMinutes:
            return 60 * 5
        case .thirtyMinutes:
            return 60 * 30
        case .onehour:
            return 60 * 60
        }
    }
}
