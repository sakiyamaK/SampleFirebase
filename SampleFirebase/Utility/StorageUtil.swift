//
//  StorageUtil.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/11/28.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation
import FirebaseStorage

class StorageUtil {
  private static let storage = Storage.storage()
  private static let storageRef = storage.reference()

  static func upload(image: UIImage, completion: ((Result<URL, Error>)->Void)? = nil) {

    guard let data = image.jpegData(compressionQuality: 1.0) else { return }

    let ref = storageRef.child("images/test.jpg")

    ref.putData(data, metadata: nil) { (metadata, error) in
      if let error = error {
        completion?(.failure(error))
        return
      }
      guard metadata != nil else {
        completion?(.failure(NSError.init(domain: "stroage metadata error", code: 100, userInfo: nil)))
        return
      }

      ref.downloadURL { (url, error) in
        guard let downloadURL = url else {
          completion?(.failure(NSError.init(domain: "stroage download url error", code: 110, userInfo: nil)))
          return
        }
        completion?(.success(downloadURL))
      }
    }
  }

  static func download(_ url: URL, completion: ((Result<UIImage, Error>)->Void)? = nil) {
    let ref = storage.reference(forURL: url.absoluteString)
    ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
      if let error = error {
        completion?(.failure(error))
        return
      }
      guard let data = data,
            let image = UIImage(data: data)
            else {
        completion?(.failure(NSError.init(domain: "data is nil", code: 120, userInfo: nil)))
        return
      }
      completion?(.success(image))
    }
  }
}
