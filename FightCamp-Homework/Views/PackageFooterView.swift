//
//  PackageFooterView.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation
import UIKit

class PackageFooterView: UIView {
    // MARK: Instance Properties

    var stackView: UIStackView!

    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        let labelStackView = UIStackView(arrangedSubviews: [paymentLabel, priceLabel])
        labelStackView.axis = .vertical
        labelStackView.alignment = .center
        labelStackView.distribution = .fillProportionally
        labelStackView.spacing = .lineHeightMultiple

        stackView = UIStackView(arrangedSubviews: [labelStackView, button])
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = .packageSpacing
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.widthAnchor.constraint(equalTo: widthAnchor),
            button.heightAnchor.constraint(equalToConstant: .buttonHeight),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1 * CGFloat.packageSpacing),
        ])
    }

    // MARK: UI Elements

    var paymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.font = .body
        return label
    }()

    var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.font = .price
        return label
    }()

    let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.buttonBackground
        button.setTitleColor(UIColor.buttonTitle, for: .normal)
        button.layer.cornerRadius = .buttonRadius
        button.titleLabel?.font = .button
        return button
    }()
}

extension PackageFooterView {
    func configureView(with viewModel: PackageViewModel) {
        paymentLabel.text = viewModel.paymentText.capitalized
        priceLabel.text = viewModel.priceText
        button.setTitle(viewModel.actionText.capitalized, for: .normal)
    }
}
