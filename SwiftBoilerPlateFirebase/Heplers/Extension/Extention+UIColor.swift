//
//  Extention+UIColor.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 24/11/23.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        UIColor(
            red: .random(in: 0 ... 1),
            green: .random(in: 0 ... 1),
            blue: .random(in: 0 ... 1),
            alpha: .random(in: 0.2 ... 0.5)
        )
    }
}
