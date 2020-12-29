//
//  RootViewController.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    // Do any additional setup after loading the view.
    let packages = DataLayer.shared.loadJson(filename: "packages")
    var viewModels = [PackageViewModel]()
    packages?.forEach({ (package) in
      viewModels.append(PackageViewModel(package))
    })
    print(viewModels)
  }

}
