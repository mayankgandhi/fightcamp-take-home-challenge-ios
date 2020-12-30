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
  var viewModel: PackageViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    viewModel = PackageViewModel(DataLayer.shared.loadJson(filename: "packages")![0])
  }

  override func loadView() {
    self.view = PackageView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    packageView.configureView(with: viewModel!)
  }

}
