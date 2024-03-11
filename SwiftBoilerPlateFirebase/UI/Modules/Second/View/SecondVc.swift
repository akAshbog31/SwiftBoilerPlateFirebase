//
//  SecondVc.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import UIKit

final class SecondVc: ViewController<SecondVm> {
    // MARK: - @IBOutlets
    @IBOutlet var lblName: UILabel!

    // MARK: - Properties
    private var disposeBag = Bag()
    private var input = AppSubject<SecondVm.Input>()

    // MARK: - Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }

    override func setUi() {
        super.setUi()

        lblName.text = viewModel.name
    }

    // MARK: - @IBActions
    @IBAction func onTapButtonBack(_: Any) {
        input.send(.popBack)
    }

    // MARK: - Functions
    private func bindViewModel() {
        viewModel.transform(input: input.eraseToAnyPublisher()).weekSink(self) { strongSelf, event in
            switch event {
            case let .loader(isLoading):
                isLoading ? strongSelf.showHUD() : strongSelf.hideHUD()
            case let .showError(msg):
                strongSelf.showAlert(msg: msg)
            }
        }.store(in: &disposeBag)
    }
}
