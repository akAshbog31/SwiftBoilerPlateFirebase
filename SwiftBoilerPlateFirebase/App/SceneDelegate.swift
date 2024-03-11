//
//  SceneDelegate.swift
//  BoilerPlate
//
//  Created by AKASH on 21/11/23.
//

import UIKit

// MARK: - SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo _: UISceneSession,
               options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        window = UIWindow(windowScene: windowScene)
        configureApp(to: .main)
    }
}

// MARK: - Extension SceneDelegate
extension SceneDelegate {
    private func configureApp(to route: Route) {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController, intialRoute: route)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        Resolver.default.register(type: Router.self) { router }
        registerDependencies()
        router.start()
    }

    /// Register dependencies such as `Repositories`, `Managers` etc.
    private func registerDependencies() {
        Resolver.default.register(type: FireBaseServices.self) { FireBaseManager() }
    }
}
