//
//  RootViewController.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

  var packageView: PackageView { return self.view as! PackageView }
  var viewModel: PackageViewModel?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let packages = DataLayer.shared.loadJson(filename: "packages")
    var viewModels = [PackageViewModel]()
    packages?.forEach({ (package) in
      viewModels.append(PackageViewModel(package))
    })
    print(viewModels)
    viewModel = viewModels[0]
  }

  override func loadView() {
    self.view = PackageView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    packageView.headerView.titleLabel.text = viewModel?.titleText
    packageView.headerView.descriptionLabel.text = viewModel?.descriptionText
    packageView.footerView.paymentLabel.text = viewModel?.paymentText
    packageView.footerView.priceLabel.text = viewModel?.priceText
    packageView.footerView.button.setTitle(viewModel?.actionText, for: .normal)
  }

}
