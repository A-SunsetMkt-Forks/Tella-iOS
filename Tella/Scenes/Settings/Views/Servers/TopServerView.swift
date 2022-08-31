//  Tella
//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import SwiftUI

struct TopServerView : View {
    
    var title : String
    
    var body: some View {
        
        Image("settings.server")
        
        Spacer()
            .frame(height: 24)
        
        Text(title)
            .font(.custom(Styles.Fonts.regularFontName, size: 18))
            .foregroundColor(.white)
    }
}


struct TopServerView_Previews: PreviewProvider {
    static var previews: some View {
        TopServerView(title: "Test")
    }
}
