//
//  Person.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/20/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation

class PersonResult: Codable {
    var result: [Person]
}

class Person: Codable {
    var id: String
    var firstName: String
    var lastName: String
    var gender: String
    var dob: String
    var email: String
    var phone: String
    var website: String
    var address: String
    var status: String
    var links: Links
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case gender
        case dob
        case email
        case phone
        case website
        case address
        case status
        case links = "_links"
    }
}

class Links: Codable {
    var edit: Link
    var avatar: Link
}

class Link: Codable {
    var href: String
}
