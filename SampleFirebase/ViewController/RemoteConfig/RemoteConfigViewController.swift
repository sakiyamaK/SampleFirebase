//
//  RemoteConfigViewController.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/08/17.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig

class RemoteConfigViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    guard let sample = ConfigUtil.shared.sample else {
      return
    }
    print(sample.value)
    print(sample.arr)

  }
}
