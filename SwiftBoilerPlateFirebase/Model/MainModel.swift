//
//  MainModel.swift
//  BoilerPlate
//
//  Created by AKASH on 21/11/23.
//

import Foundation

// MARK: - UserModel
struct UserModel: FirebaseIdentifiable {
    var id: String
    var createdAt: String?
    var email: String?
    var userName: String?
}
