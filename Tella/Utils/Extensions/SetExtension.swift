//
//  Tella
//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import Foundation


extension Set {

    mutating func insert(_ newMembers: [Element]) {
        
        newMembers.forEach { (member) in
            self.insert(member)
        }
    }
}
