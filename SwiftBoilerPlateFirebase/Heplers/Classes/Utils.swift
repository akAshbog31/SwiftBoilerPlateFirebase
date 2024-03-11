//
//  Utils.swift
//  BodyRx
//
//  Created by AKASH on 22/12/22.
//

import Foundation
import UIKit

final class Utils {
    static var shared = Utils()
    private init() {}

    func getSceneDelegate() -> SceneDelegate? {
        guard let delegate = UIApplication.shared.connectedScenes.first else {
            return nil
        }
        return delegate.delegate as? SceneDelegate ?? nil
    }

    func getAppDelegate() -> AppDelegate? {
        guard let delegate = UIApplication.shared.delegate else {
            return nil
        }
        return delegate as? AppDelegate ?? nil
    }
}
