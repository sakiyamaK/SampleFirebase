//
//  Firestore02ViewController.swift
//  SampleFirebase
//
//  Created by  on 2021/4/3.
//

import UIKit

final class Firestore02ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    Database.readUser { (result) in
      switch result {
      case .success(let users):
        users.forEach { print($0.name )}
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
