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

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondaryBackground
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews() {
    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(imagesView)
    addSubview(footerView)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .packageSpacing),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .packageSpacing),
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .packageSpacing),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .packageSpacing),

      imagesView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .packageSpacing),
      imagesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .packageSpacing),
      imagesView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1 * CGFloat.packageSpacing),

      footerView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: .packageSpacing),
      footerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .packageSpacing),
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
