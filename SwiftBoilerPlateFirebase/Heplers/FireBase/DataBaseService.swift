//
//  DataBaseService.swift
//  SwiftBoilerPlateFirebase
//
//  Created by iOS Developer on 11/03/24.
//

import Firebase
import FirebaseFirestore
import Foundation

// MARK: - DataBaseService
enum DataBaseService {
    static func get<T: Codable>(with query: Query) async throws -> T {
        let querySnapShot = try await query.getDocuments()
        if let document = querySnapShot.documents.first {
            return try document.data(as: T.self)
        } else {
            throw FirebaseError.noDocumentFound
        }
    }

    static func get<T: Codable>(with query: Query) async throws -> [T] {
        var response: [T] = []
        let querySnapshot = try await query.getDocuments()
        for document in querySnapshot.documents {
            let data = try document.data(as: T.self)
            response.append(data)
        }
        return response
    }

    static func post<T: FirebaseIdentifiable>(_ value: T, to collection: ColloectionType, for database: Firestore) async throws -> T {
        let referance = database.collection(collection.rawValue.capitalized).document()
        var valueToWrite: T = value
        valueToWrite.id = referance.documentID
        try referance.setData(from: valueToWrite)
        return valueToWrite
    }

    static func put<T: FirebaseIdentifiable>(_ value: T, to collection: ColloectionType, for database: Firestore) async throws -> T {
        let referance = database.collection(collection.rawValue.capitalized).document(value.id)
        try referance.setData(from: value)
        return value
    }

    static func delete<T: FirebaseIdentifiable>(_ value: T, in collection: ColloectionType, for database: Firestore) async throws {
        let referance = database.collection(collection.rawValue.capitalized).document(value.id)
        try await referance.delete()
    }
}
