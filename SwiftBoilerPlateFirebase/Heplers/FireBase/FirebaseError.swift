//
//  FirebaseError.swift
//  SwiftBoilerPlateFirebase
//
//  Created by iOS Developer on 11/03/24.
//

import Foundation

// MARK: - FirebaseError
enum FirebaseError: Error {
    case noDocumentFound
}

// MARK: - CustomStringConvertible
extension FirebaseError: CustomStringConvertible {
    var description: String {
        switch self {
        case .noDocumentFound:
            return "document not found"
        }
    }
}
