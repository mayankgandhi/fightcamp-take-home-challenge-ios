//
//  RootViewController.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

/// `RootViewController` is the main View Controller that contains the tableView to show the list of available packages to the user
class RootViewController: UIViewController {
    /// Section allows using Diffable DataSource
    enum Section: CaseIterable {
        case main
    }

    /// TableView Components using Diffable DataSource
    let tableView = UITableView(frame: .zero, style: .plain)
    var dataSource: UITableViewDiffableDataSource<Section, PackageViewModel>!
    lazy var currentSnapshot: NSDiffableDataSourceSnapshot<Section, PackageViewModel>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
        configureDataSource()
        updatePackages()
    }
}

extension RootViewController {
    func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .secondaryBackground
        tableView.separatorStyle = .none

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        tableView.register(PackageTableViewCell.self, forCellReuseIdentifier: PackageTableViewCell.reuseID)
    }

    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource
        <Section, PackageViewModel>(tableView: tableView) { [weak self]
            (tableView: UITableView, indexPath: IndexPath, packageItem: PackageViewModel) -> UITableViewCell? in
            guard self != nil, let cell = tableView.dequeueReusableCell(
                withIdentifier: PackageTableViewCell.reuseID,
                for: indexPath
            ) as? PackageTableViewCell else { return nil }

            cell.configureView(with: packageItem)
            return cell
        }

        dataSource.defaultRowAnimation = .fade
    }

    func updatePackages() {
        currentSnapshot = NSDiffableDataSourceSnapshot<Section, PackageViewModel>()
        currentSnapshot.appendSections([.main])

        let packages = DataLayer.shared.loadJson(filename: "packages")
        var packageViewModels = [PackageViewModel]()
        packages?.forEach { package in
            packageViewModels.append(PackageViewModel(package))
        }
        print(packageViewModels.count)
        currentSnapshot.appendItems(packageViewModels, toSection: .main)

        dataSource.apply(currentSnapshot)
    }
}
