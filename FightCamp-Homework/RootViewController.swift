//
//  RootViewController.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

//class RootViewController: UIViewController {
//  var packageView: PackageView { return view as! PackageView }
//  var viewModel: PackageViewModel!
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view.
//    viewModel = PackageViewModel(DataLayer.shared.loadJson(filename: "packages")![0])
//  }
//
//  override func loadView() {
//    view = PackageView()
//  }
//
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    packageView.configureView(with: viewModel!)
//  }
//}


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

    tableView.register(PackageTableViewCell.self, forCellReuseIdentifier: PackageTableViewCell.reuseID)
  }

  func configureDataSource() {
    self.dataSource = UITableViewDiffableDataSource
    <Section, PackageViewModel>(tableView: tableView) { [weak self]
      (tableView: UITableView, indexPath: IndexPath, packageItem: PackageViewModel) -> UITableViewCell? in
      guard self != nil , let cell = tableView.dequeueReusableCell(
        withIdentifier: PackageTableViewCell.reuseID,
              for: indexPath) as? PackageTableViewCell else { return nil }

      cell.configureView(with: packageItem)
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
