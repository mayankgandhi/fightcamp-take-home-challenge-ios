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
    backgroundColor = .secondaryBackground
    stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, imagesView, footerView])
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews() {
    stackView.axis = .vertical
    stackView.spacing = CGFloat.packageSpacing
    stackView.backgroundColor = .primaryBackground
    stackView.alignment = .leading
    stackView.layer.cornerRadius = .packageRadius
    stackView.translatesAutoresizingMaskIntoConstraints = false
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
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .packageSpacing),
      descriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),

      imagesView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .packageSpacing),
      imagesView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),
      imagesView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -1 * CGFloat.packageSpacing),

      footerView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: .packageSpacing),
      footerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: .packageSpacing),
    ])
  }

  func configureView(with viewModel: PackageViewModel) {
    titleLabel.text = viewModel.titleText.uppercased()
    descriptionLabel.text = viewModel.descriptionText.capitalized
    imagesView.configureView(with: viewModel)
    footerView.configureView(with: viewModel)
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

  var thumbnails: [UIImageView] = {
    var thumbnails = [UIImageView]()
    for _ in 0 ... 3 {
      let thumbnailImage = UIImageView()
      thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
      thumbnailImage.layer.cornerRadius = .thumbnailRadius
      thumbnailImage.heightAnchor.constraint(equalToConstant: CGFloat(75)).isActive = true
      thumbnailImage.contentMode = .scaleAspectFill
      thumbnailImage.clipsToBounds = true
      thumbnailImage.layer.borderWidth = .thumbnailBorderWidth
      thumbnailImage.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
      thumbnails.append(thumbnailImage)
    }
    return thumbnails
  }()

}
