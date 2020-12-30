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
  var labelStackView: UIStackView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondaryBackground
    layer.cornerRadius = .packageRadius

    labelStackView = UIStackView(arrangedSubviews: includedExcludedLabels)
    labelStackView.axis = .vertical
    labelStackView.distribution = .fillProportionally
    labelStackView.alignment = .leading
    labelStackView.spacing = .lineHeightMultiple

    stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, imagesView, labelStackView ,footerView])
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = CGFloat.packageSpacing
    stackView.backgroundColor = .primaryBackground
    stackView.alignment = .leading
    stackView.distribution = .fillProportionally
    stackView.layer.cornerRadius = .packageRadius
    addSubview(stackView)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([

      stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat.packageSpacing),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.packageSpacing),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat.packageSpacing),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.packageSpacing),

      titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: .packageSpacing),
      titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),
      titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1 * CGFloat.packageSpacing),

      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .packageSpacing),
      descriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),
      descriptionLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1 * CGFloat.packageSpacing),

      imagesView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .packageSpacing),
      imagesView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),
      imagesView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1 * CGFloat.packageSpacing),

      labelStackView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: .packageSpacing),
      labelStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),
      labelStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1 * CGFloat.packageSpacing),

      footerView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: .packageSpacing),
      footerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),
      footerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1 * CGFloat.packageSpacing),
    ])
  }

  func configureView(with viewModel: PackageViewModel) {
    titleLabel.text = viewModel.titleText.uppercased()
    descriptionLabel.text = viewModel.descriptionText.capitalized
    imagesView.configureView(with: viewModel)
    footerView.configureView(with: viewModel)

    // add included labels
    for index in 0 ..< viewModel.included.count {
      includedExcludedLabels[index].text = viewModel.included[index].capitalized
      includedExcludedLabels[index].font = .body
    }

    // add excluded labels
    guard let excludedItems = viewModel.excluded else { return }
    for index in viewModel.included.count ..< excludedItems.count + viewModel.included.count {
      includedExcludedLabels[index].font = .body
      includedExcludedLabels[index].textColor = .disabledLabel
      includedExcludedLabels[index].attributedText = excludedItems[index - viewModel.included.count].capitalized.strikeThrough()
    }
  }

  var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .title
    label.textColor = .brandRed
    label.sizeToFit()
    return label
  }()

  var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .body
    label.numberOfLines = 0
    label.sizeToFit()
    return label
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

  var includedExcludedLabels: [UILabel] = {
    var includedExcludedLabels = [UILabel]()
    for _ in 0 ..< 8 {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      includedExcludedLabels.append(label)
    }
    return includedExcludedLabels
  }()

}
