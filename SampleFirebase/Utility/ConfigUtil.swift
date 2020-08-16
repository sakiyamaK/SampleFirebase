//
//  ConfigValue.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/08/16.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation
import Firebase

struct SampleModel: Codable {
  static let remoteConfigKey = "sample"
  var value: Int
  var arr: [Int]

  enum CodingKeys: String, CodingKey {
    case value = "sample_value"
    case arr = "sample_array"
  }
}

class ConfigUtil {
  static let shared = ConfigUtil.init()

  private struct Key {
    static let sample: String = "sample"
  }

  private let remoteConfig = RemoteConfig.remoteConfig()
  private let settings = RemoteConfigSettings()
  private init() {
    self.settings.minimumFetchInterval = 0
    self.remoteConfig.configSettings = settings
    self.remoteConfig.fetchAndActivate { (status, error) in
      if let _error = error {
        print(_error.localizedDescription)
      }
      if status == .error {
        print(status.rawValue)
        return
      }
    }
  }

  var sample: SampleModel? {
    let data = ConfigUtil.shared.remoteConfig.configValue(forKey: SampleModel.remoteConfigKey).dataValue
    guard let _sample = try? JSONDecoder().decode(SampleModel.self, from: data)
     else {
      return nil
    }
    return _sample
  }
}
