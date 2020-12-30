//
//  RootViewController.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

  enum Section: CaseIterable {
    case main
  }

  let tableView = UITableView(frame: .zero, style: .plain)
  var dataSource: UITableViewDiffableDataSource<Section, PackageViewModel>! = nil
  var currentSnapshot: NSDiffableDataSourceSnapshot<Section, PackageViewModel>! = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    configureTableView()
    configureDataSource()
    updatePackages()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  func configureTableView() {
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableView.topAnchor.constraint(equalTo: view.topAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PackageView")
  }

  func configureDataSource() {
    self.dataSource = UITableViewDiffableDataSource
    <Section, PackageViewModel>(tableView: tableView) { [weak self]
      (tableView: UITableView, indexPath: IndexPath, packageItem: PackageViewModel) -> UITableViewCell? in
      guard self != nil else { return nil }

      let cell = tableView.dequeueReusableCell(
        withIdentifier: "PackageView",
        for: indexPath)

      let packageView = PackageView()

      cell.heightAnchor.constraint(equalToConstant: CGFloat(200)).isActive = true
      cell.widthAnchor.constraint(equalToConstant: CGFloat(200)).isActive = true

      packageView.configureView(with: packageItem)
      cell.addSubview(packageView)
      return cell
    }

    self.dataSource.defaultRowAnimation = .fade
  }

  func updatePackages() {
    currentSnapshot = NSDiffableDataSourceSnapshot<Section, PackageViewModel>()
    currentSnapshot.appendSections([.main])

    let packages = DataLayer.shared.loadJson(filename: "packages")
    var packageViewModels = [PackageViewModel]()
    packages?.forEach({ (package) in
      packageViewModels.append(PackageViewModel(package))
    })
    print(packageViewModels.count)
    currentSnapshot.appendItems(packageViewModels, toSection: .main)
    dataSource.apply(currentSnapshot)
  }
}
