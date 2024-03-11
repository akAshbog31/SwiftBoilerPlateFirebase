//
//  Route.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import UIKit

// MARK: - Route
enum Route {
    case main
    case second(name: String, eventHandler: EventHandler<SecondVcEvent>)
}

// MARK: - Equatable
extension Route: Equatable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.viewController == rhs.viewController
    }
}

extension Route {
    var viewController: UIViewController {
        switch self {
        case .main:
            return MainVc(viewModel: MainVm())
        case let .second(name, eventHandler):
            return SecondVc(viewModel: SecondVm(name: name, eventHandler: eventHandler))
        }
    }
}
