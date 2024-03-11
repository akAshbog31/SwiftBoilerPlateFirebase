//
//  FirebaseIdentifiable.swift
//  SwiftBoilerPlateFirebase
//
//  Created by iOS Developer on 11/03/24.
//

import Firebase
import FirebaseFirestore
import Foundation

// MARK: - FirebaseIdentifiable
protocol FirebaseIdentifiable: Hashable, Codable {
    var id: String { get set }
}

extension FirebaseIdentifiable {
    @discardableResult
    func post(to collection: ColloectionType, for database: Firestore) async throws -> Self {
        try await DataBaseService.post(self, to: collection, for: database)
    }

    @discardableResult
    func put(to collection: ColloectionType, for database: Firestore) async throws -> Self {
        try await DataBaseService.put(self, to: collection, for: database)
    }

    func delete(to collection: ColloectionType, for database: Firestore) async throws {
        try await DataBaseService.delete(self, in: collection, for: database)
    }
}
