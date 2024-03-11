//
//  Container.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import Foundation

// MARK: - Storable
protocol Storable {
    var identifire: UUID { get }
}

// MARK: - Container
class Container<T>: Storable {
    var identifire: UUID = .init()
    var factory: () -> T

    init(factory: @escaping () -> T) {
        self.factory = factory
    }
}
