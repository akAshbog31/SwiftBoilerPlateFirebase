//
//  AppLayout.swift
//  KarmaScore
//
//  Created by AKASH on 09/11/23.
//

import UIKit

final class AppLayout {
    static let shared = AppLayout()

    private init() {}

    func appSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1 / 2))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                      heightDimension: .estimated(30)),
                                                    elementKind: "Header",
                                                    alignment: .top)]

        return section
    }
}
