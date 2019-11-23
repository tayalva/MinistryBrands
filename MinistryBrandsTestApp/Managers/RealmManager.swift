//
//  RealmManager.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/23/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    static let shared = RealmManager()
    var realm = try! Realm()
}
