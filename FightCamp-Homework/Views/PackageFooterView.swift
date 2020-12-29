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

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews() {
    let stackView = UIStackView(arrangedSubviews: [paymentLabel, priceLabel, button])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = CGFloat.packageSpacing
    self.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.packageSpacing),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.packageSpacing)
    ])
  }

  //MARK: UI Elements
  var paymentLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
  }()

  var priceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
  }()

  let button: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor.buttonBackground
    button.setTitleColor(UIColor.buttonTitle, for: .normal)
    return button
  }()

  func configureView(with viewModel: PackageViewModel) {
    paymentLabel.text = viewModel.paymentText
    priceLabel.text = viewModel.priceText
    button.setTitle(viewModel.actionText, for: .normal)
  }

}
