//
//  Firebase.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/05/10.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation
import FirebaseCore

final class FirebaseUtil {

  static func setup() {

    #if DEBUG
    let name = "GoogleService-Info-dev"
    #else
    let name = "GoogleService-Info"
    #endif

    let filePath = Bundle.main.path(forResource: name, ofType: "plist")
    if let options = FirebaseOptions(contentsOfFile: filePath!) {
      FirebaseApp.configure(options: options)
    } else {
      assertionFailure("Could'nt load config file")
    }
  }
}
