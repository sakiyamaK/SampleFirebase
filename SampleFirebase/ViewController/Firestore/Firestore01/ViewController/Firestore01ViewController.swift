//
//  FirestoreViewController.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/06/13.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class Firestore01ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func addAction(_ sender: Any) {
    Database.addTest()
  }

  @IBAction func readAction(_ sender: Any) {
    Database.readTest() { users in
      for user in users {
        print("\(user.first), \(user.last), \(user.born)")
      }
    }
  }
}
