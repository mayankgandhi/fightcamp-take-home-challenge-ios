//
//  PackageViewModel.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

class PackageViewModel {

  private let package: Package

  // MARK: Instance Properties
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
    package.thumbnail_urls.map { (string) -> URL in
      URL(string: string)!
    }
  }
  var included:[String] {
    package.included
  }
  var paymentText: String {
    package.payment
  }
  var priceText: String {
    "$\(package.price)"
  }

  public init(_ package: Package) {
    self.package = package
  }

}
