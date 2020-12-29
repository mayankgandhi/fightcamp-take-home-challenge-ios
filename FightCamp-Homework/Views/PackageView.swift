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
    self.backgroundColor = UIColor.primaryBackground
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews() {

    let stackView = UIStackView(arrangedSubviews: [headerView, footerView])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = CGFloat.packageSpacing
    self.addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.packageSpacing),
      stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.packageSpacing)
    ])
  }

  let headerView: PackageHeaderView = {
    let headerView = PackageHeaderView()
    headerView.translatesAutoresizingMaskIntoConstraints = false
    return headerView
  }()

  let footerView: PackageFooterView = {
    let footerView = PackageFooterView()
    footerView.translatesAutoresizingMaskIntoConstraints = false
    return footerView
  }()

}

