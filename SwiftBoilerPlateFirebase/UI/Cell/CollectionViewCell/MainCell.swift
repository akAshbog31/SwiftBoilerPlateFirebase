//
//  MainCell.swift
//  BoilerPlate
//
//  Created by AKASH on 21/11/23.
//

import UIKit

final class MainCell: UICollectionViewCell {
    // MARK: - @IBOutlet
    @IBOutlet var viewBg: UIView!

    // MARK: - Properties

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()

        setUI()
    }

    // MARK: - @IBAction

    // MARK: - Functions
    private func setUI() {
        viewBg.backgroundColor = .random
    }
}
