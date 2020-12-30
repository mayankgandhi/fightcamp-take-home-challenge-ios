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

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        let hStackView = UIStackView(arrangedSubviews: thumbnails)
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.alignment = .leading
        hStackView.spacing = CGFloat.thumbnailSpacing
        hStackView.sizeToFit()

        let vStackView = UIStackView(arrangedSubviews: [thumbnailImage, hStackView])
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .vertical
        vStackView.alignment = .leading
        vStackView.spacing = CGFloat.thumbnailSpacing

        addSubview(vStackView)

        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    // MARK: UI Elements

    var thumbnailImage: UIImageView = {
        let thumbnailImage = UIImageView()
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.layer.cornerRadius = .thumbnailRadius
        thumbnailImage.contentMode = .scaleAspectFill
        thumbnailImage.heightAnchor.constraint(equalToConstant: .thumbnailHeight).isActive = true
        thumbnailImage.clipsToBounds = true
        return thumbnailImage
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

    func configureView(with viewModel: PackageViewModel) {
        thumbnailImage.load(url: viewModel.thumbnailURLs[selectedThumbnailIdx])
        for idx in 0 ... 3 {
            thumbnails[idx].load(url: viewModel.thumbnailURLs[idx])
        }
    }
}
