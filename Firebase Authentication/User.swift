//
//  User.swift
//  Firebase Authentication
//
//  Created by Hitesh Choudhary on 24/10/19.
//  Copyright © 2019 Raushan jha. All rights reserved.
//

import Foundation
class User {
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
    
}
