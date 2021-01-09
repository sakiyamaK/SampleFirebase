//
//  StorageViewController.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/11/28.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import Firebase

class StorageViewController: UIViewController {

  @IBOutlet weak var uploadImageView: UIImageView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var uploadButton: UIButton!

  @IBOutlet weak var downloadImageView: UIImageView!
  @IBOutlet weak var downloadButton: UIButton!

  var downloadURL: URL?

  override func viewDidLoad() {
    super.viewDidLoad()

    uploadButton.addTarget(self, action: #selector(upload), for: .touchUpInside)
    downloadButton.addTarget(self, action: #selector(download), for: .touchUpInside)
  }
}

private extension StorageViewController {
  @objc func upload() {
    guard let image = uploadImageView.image else { return }
    StorageUtil.upload(image: image) { result in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let url):
        self.downloadURL = url
      }
    }
  }

  @objc func download() {
    guard let downloadURL = downloadURL else { return }
    StorageUtil.download(downloadURL){ result in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let image):
        self.downloadImageView.image = image
      }
    }
  }
}
