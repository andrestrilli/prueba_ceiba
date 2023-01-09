//
//  UserModel.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
class User:Decodable {
    private(set) var id: Int?
    private(set) var name, username, email: String?
    private(set) var address: Address?
    private(set) var phone, website: String?
    private(set) var company: Company?

    init(id: Int?, name: String?, username: String?, email: String?, address: Address?, phone: String?, website: String?, company: Company?) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
}

// MARK: - Address
class Address:Decodable {
    var street, suite, city, zipcode: String?
    var geo: Geo?

    init(street: String?, suite: String?, city: String?, zipcode: String?, geo: Geo?) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

// MARK: - Geo
class Geo:Decodable {
    var lat, lng: String?

    init(lat: String?, lng: String?) {
        self.lat = lat
        self.lng = lng
    }
}

// MARK: - Company
class Company:Decodable {
    var name, catchPhrase, bs: String?

    init(name: String?, catchPhrase: String?, bs: String?) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}
