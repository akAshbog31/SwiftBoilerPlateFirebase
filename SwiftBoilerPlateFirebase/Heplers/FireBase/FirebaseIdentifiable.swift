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
    func post(to collection: ColloectionType, for collectionID: String?) async throws -> Self {
        try await DataBaseService.post(self, for: collectionID, to: collection)
    }

    @discardableResult
    func put(to collection: ColloectionType) async throws -> Self {
        try await DataBaseService.put(self, to: collection)
    }

    func delete(to collection: ColloectionType) async throws {
        try await DataBaseService.delete(self, in: collection)
    }
}
