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
  var stackView: UIStackView!

  override init(frame: CGRect) {
    super.init(frame: frame)

    let labelStackView = UIStackView(arrangedSubviews: includedExcludedLabels)
    labelStackView.axis = .vertical
    labelStackView.alignment = .leading
    labelStackView.spacing = .lineHeightMultiple

    stackView = UIStackView(arrangedSubviews: [labelStackView, paymentLabel, priceLabel, button])

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
    stackView.distribution = .fill
    addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      button.widthAnchor.constraint(equalTo: widthAnchor, constant: -2 * CGFloat.packageSpacing),
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
    button.heightAnchor.constraint(equalToConstant: .buttonHeight).isActive = true
    button.setTitleColor(UIColor.buttonTitle, for: .normal)
    button.layer.cornerRadius = .buttonRadius
    button.titleLabel?.font = .button
    return button
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

  func configureView(with viewModel: PackageViewModel) {
    paymentLabel.text = viewModel.paymentText.capitalized
    priceLabel.text = viewModel.priceText
    button.setTitle(viewModel.actionText.capitalized, for: .normal)

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
}
