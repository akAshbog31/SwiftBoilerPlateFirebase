//
//  XibView.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import UIKit

class XibView: UIView {
    // MARK: - Properties
    var contentView: UIView?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupOnLoad()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupOnLoad()
    }

    // MARK: - Functions
    func setupOnLoad() {
        guard let contentView = loadFromNib() else {
            return
        }
        addSubview(contentView)
        contentView.fixInView(self)
        self.contentView = contentView
    }
}
