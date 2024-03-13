//
//  AppRouter.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import UIKit

// MARK: - AppRouter
class AppRouter: Router {
    var navigationController: UINavigationController
    private var routeStack: [Route]
    private var currentRouteIndex: Int

    init(navigationController: UINavigationController, intialRoute: Route) {
        self.navigationController = navigationController
        routeStack = [intialRoute]
        currentRouteIndex = 0
    }

    func start() {
        let viewController = routeStack[currentRouteIndex].viewController
        navigationController.setViewControllers([viewController], animated: true)
    }

    func setRoot(to route: Route, duration: TimeInterval?, options: UIView.AnimationOptions?) {
        let viewController = route.viewController
        if let duration = duration, let options = options {
            UIView.transition(with: navigationController.view, duration: duration, options: options, animations: {
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.navigationController.setViewControllers([viewController], animated: false)
                UIView.setAnimationsEnabled(oldState)
            })
        } else {
            navigationController.setViewControllers([viewController], animated: false)
        }
    }

    func push(to route: Route, with transitionType: CATransitionType?, for interval: TimeInterval?) {
        routeStack.append(route)
        let viewController = route.viewController
        if let transitionType = transitionType, let interval = interval {
            createTransition(with: transitionType, for: interval)
            navigationController.pushViewController(viewController, animated: false)
        } else {
            navigationController.pushViewController(viewController, animated: true)
        }
        currentRouteIndex = routeStack.count - 1
    }

    func pop(with transitionType: CATransitionType?, for interval: TimeInterval?) {
        if routeStack.count > 1 {
            if let transitionType = transitionType, let interval = interval {
                createTransition(with: transitionType, for: interval)
                navigationController.popViewController(animated: false)
            } else {
                navigationController.popViewController(animated: true)
            }
            routeStack.removeLast()
            currentRouteIndex -= 1
        }
    }

    func pop(to route: Route, with transitionType: CATransitionType?, for interval: TimeInterval?) {
        guard let targetIndex = routeStack.firstIndex(of: route) else {
            return
        }
        while currentRouteIndex > targetIndex {
            if let transitionType = transitionType, let interval = interval {
                createTransition(with: transitionType, for: interval)
                navigationController.popViewController(animated: false)
            } else {
                navigationController.popViewController(animated: true)
            }
            routeStack.removeLast()
            currentRouteIndex -= 1
        }
    }

    func show(sheet route: Route, presentationStyle: UIModalPresentationStyle?, transitionStyle: UIModalTransitionStyle?) {
        let viewController = route.viewController
        if let presentationStyle = presentationStyle {
            viewController.modalPresentationStyle = presentationStyle
        }
        if let transitionStyle = transitionStyle {
            viewController.modalTransitionStyle = transitionStyle
        }
        navigationController.present(viewController, animated: true, completion: nil)
    }

    func dismiss() {
        navigationController.dismiss(animated: true)
    }
}

extension AppRouter {
    private func createTransition(with transitionType: CATransitionType, for interval: TimeInterval) {
        let transition = CATransition()
        transition.duration = interval
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = transitionType
        navigationController.view.layer.add(transition, forKey: nil)
    }
}
