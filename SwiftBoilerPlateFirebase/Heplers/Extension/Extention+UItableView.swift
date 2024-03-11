//
//  Extention+UItableView.swift
//  Summit
//
//  Created by AKASH on 17/01/23.
//

import Foundation
import UIKit

extension UITableView {
    func deque<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier) as? Cell
        else {
            fatalError("=====>Error in cell")
        }
        return cell
    }

    func reload() {
        UIView.transition(with: self, duration: 0.35, options: .transitionCrossDissolve) {
            queue.async {
                self.reloadData()
            }
        }
    }
}
