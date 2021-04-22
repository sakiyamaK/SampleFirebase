//
//  Firestore.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/06/13.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation
import FirebaseFirestore

final class Database {
  static var db: Firestore { Firestore.firestore() }
}
