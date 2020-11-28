//
//  AnalyticsViewContoller.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/08/15.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import Firebase

class AnalyticsViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    AnalyticsUtil.send(event: "pv", paramters: ["name": "AnalyticsViewController"])
  }
}
