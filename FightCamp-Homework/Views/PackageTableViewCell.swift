//
//  PackageTableViewCell.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class PackageTableViewCell: UITableViewCell {
    // MARK: Instance Properties

    static let reuseID = "PackageTableViewCell"
    private let packageView = PackageView()

    // MARK: Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PackageTableViewCell {
    private func setupView() {
        packageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(packageView)

        NSLayoutConstraint.activate([
            packageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            packageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            packageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            packageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func configureView(with packageItem: PackageViewModel) {
        packageView.configureView(with: packageItem)
    }
}
