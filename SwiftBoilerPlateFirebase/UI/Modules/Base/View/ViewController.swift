//
//  ViewController.swift
//  KarmaScore
//
//  Created by AKASH on 07/11/23.
//

import UIKit

class ViewController<T: ViewModel>: UIViewController {
    // MARK: - @IBOutlet
    var viewModel: T

    // MARK: - Properties

    // MARK: - LifeCycle
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: Self.identifier, bundle: nil)
    }

    required init?(coder: NSCoder, viewModel: T) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUi()
    }

    // MARK: - @IBAction

    // MARK: - Functions
    func setUi() {
        navigationController?.navigationBar.isHidden = true
    }
}
