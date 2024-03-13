//
//  FireBaseManager.swift
//  SwiftBoilerPlateFirebase
//
//  Created by iOS Developer on 11/03/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// MARK: - ColloectionType
enum ColloectionType: String {
    case user
}

// MARK: - FireBaseManager
final class FireBaseManager: FireBaseServices {
    private var database = Firestore.firestore()

    func createUser(email: String, password: String) async throws -> UserModel {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return UserModel(id: authResult.user.uid, createdAt: Date().toString(format: .iso8601), email: email, userName: authResult.user.email)
    }

    func signIn(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }

    func create(user: UserModel) async throws -> UserModel {
        try await user.post(to: .user, for: user.id)
    }

    func getUser(by id: String) async throws -> UserModel {
        let query = database.collection(ColloectionType.user.rawValue.capitalized).whereField("id", isEqualTo: id)
        let user: UserModel = try await DataBaseService.get(with: query)
        return user
    }
}
