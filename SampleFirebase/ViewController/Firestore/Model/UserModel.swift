//
//  UserModel.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/07/23.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

struct UserModel: Codable {

  private var _first: String?
  var first: String { _first ?? "" }
  private var _last: String?
  var last: String { _last ?? "" }
  private var _born: Int?
  var born: Int { _born ?? 0 }

  private var _weight: Double?
  var weight: Double { _weight ?? 0 }

  private var _height: String?
  var height: String { _height ?? "" }

  private enum CodingKeys: String, CodingKey {
    case _first = "first"
    case _last = "last"
    case _born = "born"
  }
}
