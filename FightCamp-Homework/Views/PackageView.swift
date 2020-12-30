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
    self.backgroundColor = UIColor.primaryBackground
    stackView = UIStackView(arrangedSubviews: [headerView, imagesView, footerView])
    setupViews()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {

    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = CGFloat.packageSpacing
    stackView.distribution = .fillProportionally
    stackView.backgroundColor = .secondaryBackground
    stackView.layer.cornerRadius = .packageRadius
    self.addSubview(stackView)

  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat.packageSpacing),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.packageSpacing),
      stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -CGFloat.packageSpacing),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CGFloat.packageSpacing)
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

