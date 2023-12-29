//
//  User.swift
//  Socialends
//
//  Created by Thanasis Galanis on 29/12/23.
//

import Foundation

struct User: Codable {
    var login: String
    var aavatarURL: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
