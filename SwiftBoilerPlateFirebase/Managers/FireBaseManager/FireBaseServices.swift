//
//  FireBaseServices.swift
//  SwiftBoilerPlateFirebase
//
//  Created by iOS Developer on 11/03/24.
//

import Foundation

protocol FireBaseServices {
    func createUser(email: String, password: String) async throws -> UserModel

    func signIn(email: String, password: String) async throws

    func create(user: UserModel) async throws -> UserModel

    func getUser(by id: String) async throws -> UserModel
}
