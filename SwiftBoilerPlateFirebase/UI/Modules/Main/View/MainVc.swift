//
//  MainVc.swift
//  SwiftBoilerPlate
//
//  Created by AKASH BOGHANI on 10/03/24.
//

import UIKit

// MARK: - MainVc
final class MainVc: ViewController<MainVm> {
    // MARK: - @IBOutlets
    @IBOutlet var clvMain: UICollectionView!

    // MARK: - Properties
    private var disposeBag = Bag()
    private var input = AppSubject<MainVm.Input>()

    // MARK: - Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        input.send(.viewDidLoad)
    }

    override func setUi() {
        super.setUi()

        clvMain.delegate = self
        clvMain.dataSource = self
        clvMain.register(R.nib.headerTitleCell, forSupplementaryViewOfKind: "Header")
        clvMain.register(R.nib.mainCell)
        configureCollectionView()
    }

    // MARK: - @IBActions

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

    private func configureCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0: return AppLayout.shared.appSection()
            case 1: return AppLayout.shared.appSection()
            default: return AppLayout.shared.appSection()
            }
        }
        clvMain.setCollectionViewLayout(layout, animated: true)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension MainVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in _: UICollectionView) -> Int {
        2
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 6
        default: return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell: MainCell = collectionView.deque(indexPath: indexPath)
            return cell
        case 1:
            let cell: MainCell = collectionView.deque(indexPath: indexPath)
            return cell
        default:
            let cell: MainCell = collectionView.deque(indexPath: indexPath)
            return cell
        }
    }

    func collectionView(_: UICollectionView, didSelectItemAt _: IndexPath) {
        input.send(.navigateToSecondVc)
    }

    func collectionView(_: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            guard let header = clvMain.dequeueReusableSupplementaryView(ofKind: kind,
                                                                        withReuseIdentifier: R.nib.headerTitleCell,
                                                                        for: indexPath) else {
                return .init()
            }
            switch indexPath.section {
            case 0:
                header.lblTitle.text = "Top Relationship"
            case 1:
                header.lblTitle.text = "Overview"
            default:
                header.lblTitle.text = "Top Relationship"
            }
            return header
        }
        return UICollectionReusableView()
    }
}
