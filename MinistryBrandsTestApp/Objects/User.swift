//
//  User.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/23/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation
import RealmSwift


@objcMembers class User: Object {
    dynamic var name: String = ""
    dynamic var email: String = ""
    dynamic var phone: String = ""
    dynamic var address: String = ""
    dynamic var dob: String = ""
    dynamic var id: String = "1"

    override static func primaryKey() -> String {
        return "id"
    }
}
