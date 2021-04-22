//
//  UserModel.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2021/04/05.
//  Copyright © 2021 sakiyamaK. All rights reserved.
//

import Foundation

struct UserModel: Codable {

  private var _name: String?
  var name: String { _name ?? "" }

  private var _imageURLStr: String?
  var imageURL: URL? { URL(string: _imageURLStr ?? "") }

  private var createdAt: Date?

  private enum CodingKeys: String, CodingKey {
    case _name = "name"
    case _imageURLStr = "image_url"
    case createdAt = "created_at"
  }
}
