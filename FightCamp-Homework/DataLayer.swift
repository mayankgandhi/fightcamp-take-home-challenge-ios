//
//  DataLayer.swift
//  FightCamp-Homework
//
//  Created by Mayank Gandhi on 12/29/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation

class DataLayer {

  static let shared = DataLayer()

  private init() { }

  func loadJson(filename fileName: String) -> [Package]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode([Package].self, from: data)
        return jsonData
      } catch {
        print("error:\(error)")
      }
    }
    return nil
  }
  
}
