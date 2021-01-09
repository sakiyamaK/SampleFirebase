//
//  AuthViewController.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/08/04.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import FirebaseAuth


final class AuthViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    Auth.auth().currentUser
  }
}
