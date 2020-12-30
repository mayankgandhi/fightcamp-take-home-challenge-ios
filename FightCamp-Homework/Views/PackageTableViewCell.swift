//
//  PackageTableViewCell.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class PackageTableViewCell: UITableViewCell {

  static let reuseID = "PackageTableViewCell"

  let packageView = PackageView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupView() {

    contentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true

    contentView.addSubview(packageView)

    NSLayoutConstraint.activate([
      packageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      packageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      packageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      packageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }

  func configureView(with packageItem: PackageViewModel) {
    packageView.configureView(with: packageItem)
  }

}
