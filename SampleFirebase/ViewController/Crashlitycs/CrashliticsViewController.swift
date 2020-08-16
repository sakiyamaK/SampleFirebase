//
//  CrashliticsViewController.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/08/16.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class CrashliticsViewController: UIViewController {
  @IBAction func tapCrash(_ sender: Any) {
    fatalError()
  }
}
