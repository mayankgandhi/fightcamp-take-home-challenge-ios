//
//  PackageHeaderView.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

class PackageHeaderView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = CGFloat.packageSpacing
    self.addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.packageSpacing),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.packageSpacing),
    ])
  }

  //MARK: UI Elements
  var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    label.font = .title
    label.textColor = .brandRed
    return label
  }()

  var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .body
    label.sizeToFit()
    return label
  }()

  func configureView(with viewModel: PackageViewModel) {
    titleLabel.text = viewModel.titleText.uppercased()
    descriptionLabel.text = viewModel.descriptionText.capitalized
  }

}
