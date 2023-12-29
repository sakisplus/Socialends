//
//  ErrorMessages.swift
//  Socialends
//
//  Created by Thanasis Galanis on 29/12/23.
//

import Foundation

enum SEError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
