//
//  Fonts.swift
//  FightCamp-Homework
//
//  Created by Alexandre Marcotte on 6/17/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import UIKit

// MARK: - Font

public extension UIFont {
    /// Package title label font
    static var title = UIFont(
        name: .groteskSquare,
        size: 36
    )!

    /// Package description label & package accessories label & price title label
    static var body = UIFont(
        name: .graphikMedium,
        size: 16
    )!

    /// Price label font
    static var price = UIFont(
        name: .graphikMedium,
        size: 26
    )!

    /// CTA button font
    static var button = UIFont(
        name: .graphikMedium,
        size: 16
    )!
}

// MARK: - Font names

private extension String {
    static let graphikMedium: String = "Graphik-Medium"
    static let graphikRegular: String = "Graphik-Regular"
    static let groteskSquare: String = "NewGroteskSquareFOUR"
}
