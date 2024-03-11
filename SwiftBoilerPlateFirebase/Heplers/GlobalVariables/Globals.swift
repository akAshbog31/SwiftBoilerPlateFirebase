//
//  Globals.swift
//  Squeezee
//
//  Created by AKASH on 19/09/23.
//

import Combine
import Foundation
import UIKit

// MARK: - TypeAlice
typealias TaskBag = Set<TaskCancellables>
typealias Bag = Set<AnyCancellable>
typealias AppSubject<T> = PassthroughSubject<T, Never>
typealias AppAnyPublisher<T> = AnyPublisher<T, Never>
typealias EventHandler<T> = (_ event: T) -> Void

// MARK: - Public Valriable
public let queue = DispatchQueue.main

// MARK: - ValidationError
enum ValidationError: Error {
    case empty(type: String)
    case inValidEmailOrPhonenumber
    case inValidPassword
    case conformPaaswordNotMatch
    case inValidOtpCount
}

// MARK: - CustomStringConvertible
extension ValidationError: CustomStringConvertible {
    var description: String {
        switch self {
        case let .empty(type):
            return "\(type) must not empty."
        case .inValidEmailOrPhonenumber:
            return "Email/Phone number is not valid."
        case .inValidPassword:
            return "Password length must be 8 and it should contain uppercase character, lowercase character and symbols."
        case .conformPaaswordNotMatch:
            return "Conform password not match with password."
        case .inValidOtpCount:
            return "OTP length must be 4."
        }
    }
}

// MARK: - AppError
enum AppError: Error {
    case inValidURL
}

// MARK: - CustomStringConvertible
extension AppError: CustomStringConvertible {
    var description: String {
        switch self {
        case .inValidURL:
            return "URL not valid."
        }
    }
}
