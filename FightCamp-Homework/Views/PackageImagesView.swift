//
//  PackageImagesView.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

class PackageImagesView: UIView {

  private var selectedThumbnailIdx = 0

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {

    let hStackView = UIStackView(arrangedSubviews: thumbnails)
    hStackView.translatesAutoresizingMaskIntoConstraints = false
    hStackView.axis = .horizontal
    hStackView.distribution = .fillProportionally
    hStackView.alignment = .leading
    hStackView.spacing = CGFloat.thumbnailSpacing

    let vStackView = UIStackView(arrangedSubviews: [thumbnailImage, hStackView])
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.axis = .vertical
    vStackView.distribution = .fillProportionally
    vStackView.spacing = CGFloat.thumbnailSpacing
    self.addSubview(vStackView)

    NSLayoutConstraint.activate([
      vStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.packageSpacing),
      vStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.packageSpacing),
      thumbnailImage.heightAnchor.constraint(equalToConstant: .thumbnailHeight),
      thumbnailImage.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*CGFloat.packageSpacing),
    ])
  }

  //MARK: UI Elements
  var thumbnailImage: UIImageView = {
    let thumbnailImage = UIImageView()
    thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
    thumbnailImage.layer.cornerRadius = .thumbnailRadius
    thumbnailImage.contentMode = .scaleAspectFill
    thumbnailImage.clipsToBounds = true
    return thumbnailImage
  }()

  var thumbnails: [UIImageView] = {
    var thumbnails = [UIImageView]()
    for _ in 0...3 {
      let thumbnailImage = UIImageView()
      thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
      thumbnailImage.layer.cornerRadius = .thumbnailRadius
      thumbnailImage.heightAnchor.constraint(equalToConstant: CGFloat(60)).isActive = true
      thumbnailImage.contentMode = .scaleAspectFill
      thumbnailImage.clipsToBounds = true
      thumbnailImage.layer.borderWidth = .thumbnailBorderWidth
      thumbnailImage.layer.borderColor = UIColor.thumbnailBorder(selected: false).cgColor
      thumbnails.append(thumbnailImage)
    }
    return thumbnails
  }()

  func configureView(with viewModel: PackageViewModel) {
    thumbnailImage.load(url: viewModel.thumbnailURLs[selectedThumbnailIdx])
    for idx in 0...3 {
      thumbnails[idx].load(url: viewModel.thumbnailURLs[idx])
    }
  }
}


