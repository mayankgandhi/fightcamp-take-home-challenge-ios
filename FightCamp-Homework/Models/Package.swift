//
//  Package.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation

struct Package: Codable {
  let title: String
  let desc: String
  let headline: String?
  let thumbnail_urls: [String]
  let included: [String]
  let payment: String
  let price: Int
  let action: String
}
