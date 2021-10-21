//
//  ConfirmLPasswordView.swift
//  Tella
//
//   
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

struct ConfirmLockPasswordView: View {
    
    @EnvironmentObject private var appViewState: AppViewState
    @ObservedObject var viewModel : LockViewModel
    @State var shouldShowError : Bool = false
    
    var body: some View {
        
        PasswordView(lockViewData: LockConfirmPasswordData(),
                     nextButtonAction: .action,
                     fieldContent: $viewModel.confirmPassword,
                     shouldShowError: $shouldShowError,
                     destination: EmptyView()) {
            
            if viewModel.shouldShowError {
                shouldShowError = true
            } else {
                self.appViewState.resetToMain()
            }
        }
    }
}

struct ConfirmLPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmLockPasswordView(viewModel: LockViewModel())
    }
}
