//
//  PackageView.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

class PackageView: UIView {

  var stackView: UIStackView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    stackView = UIStackView(arrangedSubviews: [headerView, imagesView, footerView])
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews() {
    stackView.axis = .vertical
    stackView.spacing = CGFloat.packageSpacing
    stackView.backgroundColor = .secondaryBackground
    stackView.alignment = .leading
    stackView.distribution = .fillProportionally
    stackView.layer.cornerRadius = .packageRadius
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.clipsToBounds = true
    addSubview(stackView)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, constant: -2*CGFloat.packageSpacing),
      stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat.packageSpacing),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.packageSpacing),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat.packageSpacing),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.packageSpacing),
    ])
  }

  func configureView(with viewModel: PackageViewModel) {
    headerView.configureView(with: viewModel)
    imagesView.configureView(with: viewModel)
    footerView.configureView(with: viewModel)
  }

  let headerView: PackageHeaderView = {
    let headerView = PackageHeaderView()
    headerView.translatesAutoresizingMaskIntoConstraints = false
    return headerView
  }()

  let imagesView: PackageImagesView = {
    let imagesView = PackageImagesView()
    imagesView.translatesAutoresizingMaskIntoConstraints = false
    return imagesView
  }()

  let footerView: PackageFooterView = {
    let footerView = PackageFooterView()
    footerView.translatesAutoresizingMaskIntoConstraints = false
    return footerView
  }()

}
