//
//  PackageViewModel.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

struct PackageViewModel: Hashable {
    // MARK: Instance Properties

    private let package: Package

    let id = UUID()

    // MARK: ViewModel Properties

    var titleText: String {
        package.title
    }

    var descriptionText: String {
        package.desc
    }

    var headlineText: String? {
        package.headline
    }

    var thumbnailURLs: [URL] {
        var thumbnailURLS = [URL]()
        package.thumbnail_urls.forEach { urlString in
            thumbnailURLS.append(URL(string: urlString)!)
        }
        return thumbnailURLS
    }

    var included: [String] {
        package.included
    }

    var excluded: [String]? {
        package.excluded
    }

    var paymentText: String {
        package.payment
    }

    var priceText: String {
        "$\(package.price)"
    }

    var actionText: String {
        package.action
    }

    // MARK: Initializer

    public init(_ package: Package) {
        self.package = package
    }

    /// Hashable Conformance allows using these ViewModels in `UITableViewDiffableDataSource`
    static func == (lhs: PackageViewModel, rhs: PackageViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
